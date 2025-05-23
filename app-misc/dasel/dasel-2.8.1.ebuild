# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="Query, update and convert data structures from the command line"
HOMEPAGE="https://github.com/TomWright/dasel"
SRC_URI="https://github.com/TomWright/dasel/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT Apache-2.0 BSD BSD-2 ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_compile() {
	CGO_ENABLED=0 go build -o bin/dasel -ldflags="-X 'github.com/tomwright/dasel/v2/internal.Version=${PV}'" ./cmd/dasel || die
}

src_install() {
	dobin bin/dasel
	dodoc CHANGELOG.md README.md
}

