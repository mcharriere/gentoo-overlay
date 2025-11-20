# Copyright 1999-2021 Gentoo Authors
# # Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin/}"
MY_TAR_NAME="helm-v${PV}-linux-amd64"

DESCRIPTION=" The Kubernetes Package Manager "
HOMEPAGE="https://github.com/helm/helm"
SRC_URI="https://get.helm.sh/${MY_TAR_NAME}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
KEYWORDS="amd64"

SLOT="0"

RDEPEND="
"

S="${WORKDIR}"

QA_PREBUILT="
/opt/helm/helm
"

src_install() {
	exeinto /opt/helm
	doexe "${S}"/linux-amd64/helm
	dosym /opt/helm/helm /usr/bin/helm
}

