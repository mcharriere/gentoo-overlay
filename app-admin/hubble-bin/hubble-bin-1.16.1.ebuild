# Copyright 1999-2021 Gentoo Authors
# # Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin/}"
MY_TAR_NAME="${MY_PN}-linux-amd64"

DESCRIPTION=" Observability & Troubleshooting for Kubernetes Services "
HOMEPAGE="https://cilium.io"
SRC_URI="https://github.com/cilium/hubble/releases/download/v${PV}/${MY_TAR_NAME}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
KEYWORDS="amd64"

SLOT="0"

RDEPEND="
"

S="${WORKDIR}"

QA_PREBUILT="
/opt/hubble/hubble
"

src_install() {
	exeinto /opt/hubble
	doexe "${S}"/hubble
	dosym /opt/hubble/hubble /usr/bin/hubble
}

