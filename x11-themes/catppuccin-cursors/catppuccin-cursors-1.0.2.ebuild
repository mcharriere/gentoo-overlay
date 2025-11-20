# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Soothing pastel mouse cursors"
HOMEPAGE="https://github.com/catppuccin"

MY_URI="https://github.com/catppuccin/cursors/releases/download/v${PV}/"
MY_FRAPPE="Catppuccin-Frappe"
MY_LATTE="Catppuccin-Latte"
MY_MACCHIATO="Catppuccin-Macchiato"
MY_MOCHA="Catppuccin-Mocha"

SRC_URI="
	frappe? (
		${MY_URI}/${MY_FRAPPE}-Dark-Cursors.zip      -> ${P}-frappe-dark.zip
		${MY_URI}/${MY_FRAPPE}-Light-Cursors.zip     -> ${P}-frappe-light.zip
		${MY_URI}/${MY_FRAPPE}-Blue-Cursors.zip      -> ${P}-frappe-blue.zip
		${MY_URI}/${MY_FRAPPE}-Flamingo-Cursors.zip  -> ${P}-frappe-flamingo.zip
		${MY_URI}/${MY_FRAPPE}-Green-Cursors.zip     -> ${P}-frappe-green.zip
		${MY_URI}/${MY_FRAPPE}-Lavender-Cursors.zip  -> ${P}-frappe-lavender.zip
		${MY_URI}/${MY_FRAPPE}-Maroon-Cursors.zip    -> ${P}-frappe-maroon.zip
		${MY_URI}/${MY_FRAPPE}-Mauve-Cursors.zip     -> ${P}-frappe-mauve.zip
		${MY_URI}/${MY_FRAPPE}-Peach-Cursors.zip     -> ${P}-frappe-peach.zip
		${MY_URI}/${MY_FRAPPE}-Pink-Cursors.zip      -> ${P}-frappe-pink.zip
		${MY_URI}/${MY_FRAPPE}-Red-Cursors.zip       -> ${P}-frappe-red.zip
		${MY_URI}/${MY_FRAPPE}-Rosewater-Cursors.zip -> ${P}-frappe-rosewater.zip
		${MY_URI}/${MY_FRAPPE}-Sapphire-Cursors.zip  -> ${P}-frappe-sapphire.zip
		${MY_URI}/${MY_FRAPPE}-Sky-Cursors.zip       -> ${P}-frappe-sky.zip
		${MY_URI}/${MY_FRAPPE}-Teal-Cursors.zip      -> ${P}-frappe-teal.zip
		${MY_URI}/${MY_FRAPPE}-Yellow-Cursors.zip    -> ${P}-frappe-yellow.zip
	)
"
S="${WORKDIR}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+frappe latte macchiato mocha"
REQUIRED_USE="|| ( frappe latte macchiato mocha )"

BDEPEND="app-arch/unzip"

src_install() {
	insinto "/usr/share/icons"
	for folder in * ; do
		if [ -d "${folder}" ]; then
			doins -r "${folder}"
		fi
	done
}

