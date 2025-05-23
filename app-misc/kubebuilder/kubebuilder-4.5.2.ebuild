# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="Kubebuilder - SDK for building Kubernetes APIs using CRDs"
HOMEPAGE="https://github.com/kubernetes-sigs/kubebuilder"
SRC_URI="https://github.com/kubernetes-sigs/kubebuilder/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="$SRC_URI https://raw.githubusercontent.com/mcharriere/gentoo-overlay/refs/heads/main/deps/${P}-deps.tar.xz"

LICENSE="MIT Apache-2.0 BSD BSD-2 ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_compile() {
	CGO_ENABLED=0 go build -ldflags="-X sigs.k8s.io/kubebuilder/v4/cmd.kubeBuilderVersion=${PV}" -o bin/kubebuilder ./main.go || die
}

src_install() {
	dobin bin/kubebuilder
}

