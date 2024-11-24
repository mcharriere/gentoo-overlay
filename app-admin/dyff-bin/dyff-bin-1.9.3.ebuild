# Copyright 1999-2021 Gentoo Authors
# # Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin/}"

DESCRIPTION="/ˈdʏf/ - diff tool for YAML files, and sometimes JSON"
HOMEPAGE="https://github.com/homeport/dyff"
SRC_URI="https://github.com/homeport/dyff/releases/download/v${PV}/dyff_${PV}_linux_amd64.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
KEYWORDS="amd64"

SLOT="0"

RDEPEND="
"

S="${WORKDIR}"

QA_PREBUILT="
/opt/dyff/dyff
"

src_install() {
	exeinto /opt/dyff
	doexe "${S}"/dyff
	dosym /opt/dyff/dyff /usr/bin/dyff
}

