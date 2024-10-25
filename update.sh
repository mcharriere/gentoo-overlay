#!/bin/bash

REPO="/var/db/repos/mcharriere"
DEPS_PATH="$REPO/deps"

GROUP="app-misc"
NAME="dasel"
VERSION="2.8.1"
EBUILD_PATH="$REPO/$GROUP/$NAME"
EBUILD_FILE="$NAME-VERSION.ebuild"
PKG="$NAME-$VERSION-deps.tar.xz"

cd $EBUILD_PATH
ebuild "$EBUILD_FILE" unpack
cd "/var/tmp/portage/$GROUP/$NAME-$VERSION/work/$NAME-$VERSION"
go mod vendor

cd ..
tar --create --auto-compress --file $PKG "$NAME-$VERSION/vendor"
cp $PKG $DEPS_PATH

cd $REPO
git add "deps/$PKG"
git commit -m "update $PKG"
git push origin main

cd $EBUILD_PATH
awk "/^SRC_URI=/{ print;print \"SRC_URI=\$SRC_URI $DEPS_REPO/\${P}-deps.tar.xz\";next }1" $EBUILD_FILE
ebuild $EBUILD_FILE manifest
git add .
git commit -m "update $GROUP/$NAME $VERSION"
