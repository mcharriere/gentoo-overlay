# Copyright 1999-2021 Gentoo Authors
# # Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin/}"
MY_TAR_NAME="flux_${PV}_linux_amd64"

DESCRIPTION="Open and extensible continuous delivery solution for Kubernetes. Powered by GitOps Toolkit."
HOMEPAGE="https://github.com/fluxcd/flux2"
SRC_URI="https://github.com/fluxcd/flux2/releases/download/v${PV}/${MY_TAR_NAME}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
KEYWORDS="amd64"

SLOT="0"

RDEPEND="
"

S="${WORKDIR}"

QA_PREBUILT="
/opt/fluxcd/flux
"

src_install() {
	exeinto /opt/fluxcd
	doexe "${S}"/flux
	dosym /opt/fluxcd/flux /usr/bin/flux
}

