# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="Command-line tool for managing and understanding Gateway API resources in your Kubernetes cluster."
HOMEPAGE="https://github.com/kubernetes-sigs/gwctl"
SRC_URI="https://github.com/kubernetes-sigs/gwctl/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="$SRC_URI https://raw.githubusercontent.com/mcharriere/gentoo-overlay/refs/heads/main/deps/${P}-deps.tar.xz"

LICENSE="MIT Apache-2.0 BSD BSD-2 ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_compile() {
	CGO_ENABLED=0 go build -ldflags="-X sigs.k8s.io/gwctl/pkg/version.version=${PV}" -o bin/gwctl ./main.go || die
}

src_install() {
	dobin bin/gwctl
}

