# Copyright 1999-2021 Gentoo Authors
# # Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin/}"
MY_TAR_NAME="${MY_PN}-v${PV}-linux-amd64"

DESCRIPTION="A modern load testing tool, using Go and JavaScript"
HOMEPAGE="https://k6.io"
SRC_URI="https://github.com/grafana/k6/releases/download/v${PV}/${MY_TAR_NAME}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
KEYWORDS="amd64"

SLOT="0"

RDEPEND="
"

S="${WORKDIR}"

QA_PREBUILT="
/opt/k6/k6
"

src_install() {
	exeinto /opt/${MY_PN}
	doexe "${S}"/${MY_TAR_NAME}/k6
	dosym /opt/${MY_PN}/k6 /usr/bin/k6
}

