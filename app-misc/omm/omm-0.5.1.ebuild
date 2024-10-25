# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="Query, update and convert data structures from the command line"
HOMEPAGE="https://github.com/dhth/omm"
SRC_URI="https://github.com/dhth/omm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT Apache-2.0 BSD BSD-2 ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_compile() {
	CGO_ENABLED=0 go build -o bin/omm -ldflags="-X 'github.com/dhth/omm/main.version=${PV}'" ./cmd/omm || die
}

src_install() {
	dobin bin/omm
	dodoc CHANGELOG.md README.md
}

