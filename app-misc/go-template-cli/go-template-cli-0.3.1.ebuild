# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="render json, yaml & toml with go templates, from the command line"
HOMEPAGE="https://github.com/bluebrown/go-template-cli"
SRC_URI="https://github.com/bluebrown/go-template-cli/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="$SRC_URI https://raw.githubusercontent.com/mcharriere/gentoo-overlay/refs/heads/main/deps/${P}-deps.tar.xz"

LICENSE="MIT Apache-2.0 BSD BSD-2 ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_compile() {
	CGO_ENABLED=0 go build -o bin/tpl -ldflags="-X 'github.com/bluebrown/go-template-cli/cmd/tpl/internal.version=${PV}'" ./cmd/tpl || die
}

src_install() {
	dobin bin/tpl
	# dodoc CHANGELOG.md README.md
}

