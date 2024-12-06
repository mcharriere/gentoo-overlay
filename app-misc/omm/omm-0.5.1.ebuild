# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="A keyboard-driven task manager for the command line"
HOMEPAGE="https://github.com/dhth/omm"
SRC_URI="https://github.com/dhth/omm/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="$SRC_URI https://raw.githubusercontent.com/mcharriere/gentoo-overlay/refs/heads/main/deps/${P}-deps.tar.xz"

LICENSE="MIT Apache-2.0 BSD BSD-2 ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_compile() {
	CGO_ENABLED=0 go build -o bin/omm -ldflags="-X 'github.com/dhth/omm/main.version=${PV}'" ./main.go || die
}

src_install() {
	dobin bin/omm
	# dodoc CHANGELOG.md README.md
}

