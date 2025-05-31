# Copyright 1999-2021 Gentoo Authors
# # Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin/}"
MY_TAR_NAME="${MY_PN}_v${PV}_linux_amd64"

DESCRIPTION="Manages Envoy Proxy as a Standalone or Kubernetes-based Application Gateway"
HOMEPAGE="https://gateway.envoyproxy.io/"
SRC_URI="https://github.com/envoyproxy/gateway/releases/download/v${PV}/${MY_TAR_NAME}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
KEYWORDS="amd64"

SLOT="0"

RDEPEND="
"

S="${WORKDIR}"

QA_PREBUILT="
/opt/egctl/egctl
"

src_install() {
	exeinto /opt/egctl
	doexe "${S}"/bin/linux/amd64/egctl
	dosym /opt/egctl/egctl /usr/bin/egctl
}

