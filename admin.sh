#!/bin/bash
set -e

source "$HOME/bin/.utils"

print_usage() {
  orange "admin.sh - Build and update this overlay"
  echo " "
  underline "Usage:"
  echo "admin.sh <action> <package>"
  echo " "
  underline "Examples:"
  echo "> admin.sh deps app-admin/hubble-bin"
  echo " "
  underline "Actions:"
  echo "deps                      build go deps tar"
  echo " "
  underline "Options:"
  echo "-h, --help                show this help text"
}

POS_ARGS=()

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      print_usage
      exit 0
      ;;
    deps)
      ACTION=$1
      shift
      ;;
    --version)
      shift
      VERSION=$1
      shift
      ;;
    *)
      POS_ARGS+="$1"
      shift
      ;;
  esac
done

REPO="/var/db/repos/mcharriere"
DEPS_PATH="$REPO/deps"
DEPS_REPO="https://raw.githubusercontent.com/mcharriere/gentoo-overlay/refs/heads/main/deps"

function deps() {
    local GROUP=$1
    local NAME=$2
    local VERSION=$3

    local EBUILD_PATH="$REPO/$GROUP/$NAME"
    local EBUILD_FILE="$NAME-$VERSION.ebuild"
    local DEPS_PKG="$NAME-$VERSION-deps.tar.xz"

    echo "working on $EBUILD_PATH with $EBUILD_FILE"

    cd $EBUILD_PATH
    ebuild "$EBUILD_FILE" unpack
    sudo chmod g+rwX -R "/var/tmp/portage/$GROUP/$NAME-$VERSION"
    cd "/var/tmp/portage/$GROUP/$NAME-$VERSION/work/$NAME-$VERSION"
    go mod vendor

    cd ..
    echo "generating $DEPS_PKG"
    tar --create --auto-compress --file $DEPS_PKG "$NAME-$VERSION/vendor"
    mv $DEPS_PKG $DEPS_PATH

    cd $EBUILD_PATH
    ebuild "$EBUILD_FILE" clean

    cd $REPO
    git add "deps/$DEPS_PKG"
    git commit -m "generate $DEPS_PKG"
    git push origin main

    cd $EBUILD_PATH
    awk -i inplace "/^SRC_URI=/{ print;print \"SRC_URI=\$SRC_URI $DEPS_REPO/\${P}-deps.tar.xz\";next }1" $EBUILD_FILE
    exit 0
    ebuild $EBUILD_FILE manifest
    git add .
    git commit -m "update $GROUP/$NAME $VERSION"
    git push origin main
}

case ${#POS_ARGS[@]} in
  0)
    print_usage
    echo "pepepepe"
    exit 1
    ;;
  1)
    PKG="${POS_ARGS[0]}"
    GROUP=`echo $PKG | cut -d "/" -f 1`
    NAME=`echo $PKG | cut -d "/" -f 2`
    # TODO: grab version from ebuild file name
    deps $GROUP $NAME $VERSION
    ;;
  *)
    print_usage
    echo "papapa"
    exit 1
    ;;
esac

