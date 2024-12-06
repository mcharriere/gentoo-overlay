# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="Query, update and convert data structures from the command line"
HOMEPAGE="https://github.com/kubernetes-sigs/kind/"
SRC_URI="https://github.com/kubernetes-sigs/kind/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="$SRC_URI https://raw.githubusercontent.com/mcharriere/gentoo-overlay/refs/heads/main/deps/${P}-deps.tar.xz"

LICENSE="MIT Apache-2.0 BSD BSD-2 ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_compile() {
    go build -v -o "bin/kind" -trimpath -ldflags="-buildid= -w" || die
}

src_install() {
	dobin bin/kind
}

