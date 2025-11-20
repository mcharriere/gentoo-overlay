# Copyright 1999-2021 Gentoo Authors
# # Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin/}"

DESCRIPTION="The Teleport Access Platform delivers on-demand, least privileged access to infrastructure on a foundation of cryptographic identity and zero trust, with built-in identity security and policy governance."
HOMEPAGE="https://goteleport.com/"
SRC_URI="https://cdn.teleport.dev/teleport-v${PV}-linux-amd64-bin.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
KEYWORDS="amd64"

SLOT="0"

RDEPEND="
"

S="${WORKDIR}"

QA_PREBUILT="
/opt/teleport/tsh
"

src_install() {
	exeinto /opt/teleport
	doexe "${S}"/teleport/fdpass-teleport
	doexe "${S}"/teleport/tbot
	doexe "${S}"/teleport/tctl
	doexe "${S}"/teleport/teleport
	doexe "${S}"/teleport/tsh
	dosym /opt/teleport/fdpass-teleport /usr/bin/fdpass-teleport
	dosym /opt/teleport/tbot /usr/bin/tbot
	dosym /opt/teleport/tctl /usr/bin/tctl
	dosym /opt/teleport/teleport /usr/bin/teleport
	dosym /opt/teleport/tsh /usr/bin/tsh
}

