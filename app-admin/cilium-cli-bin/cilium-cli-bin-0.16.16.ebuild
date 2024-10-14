# Copyright 1999-2021 Gentoo Authors
# # Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-cli-bin/}"
MY_TAR_NAME="${MY_PN}-linux-amd64"

DESCRIPTION="CLI to install, manage & troubleshoot Kubernetes clusters running Cilium"
HOMEPAGE="https://cilium.io"
SRC_URI="https://github.com/cilium/cilium-cli/releases/download/v${PV}/${MY_TAR_NAME}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
KEYWORDS="amd64"

SLOT="0"

RDEPEND="
"

S="${WORKDIR}"

QA_PREBUILT="
/opt/cilium/cilium
"

src_install() {
	exeinto /opt/cilium
	doexe "${S}"/cilium
	dosym /opt/cilium/cilium /usr/bin/cilium
}

