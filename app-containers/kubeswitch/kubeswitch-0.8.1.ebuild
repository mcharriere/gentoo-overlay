# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="The kubectx for operators."
HOMEPAGE="https://github.com/danielfoehrKn/kubeswitch"

SRC_URI="https://github.com/danielfoehrKn/kubeswitch/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"

KEYWORDS="~amd64"

src_prepare() {
	default
	rm Makefile || die
}

src_compile() {
	GOOS=linux \
	GOARCH=amd64 \
		go build \
		-ldflags "-w -X github.com/danielfoehrkn/kubeswitch/cmd/switcher.version=${VERSION} -X github.com/danielfoehrkn/kubeswitch/cmd/switcher.buildDate=${DATE}" \
		-o hack/switch/switcher ./cmd/main.go
}

src_install() {
	dobin hack/switch/switcher

	default
}
