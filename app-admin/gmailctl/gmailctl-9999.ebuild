# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module git-r3

DESCRIPTION="Declarative configuration for Gmail filters"
HOMEPAGE="https://github.com/mcharriere/gmailctl/"

EGIT_REPO_URI="https://github.com/mcharriere/gmailctl.git"

LICENSE="Apache-2.0"
SLOT="0"

KEYWORDS="~amd64"

src_compile() {
	GOOS=linux \
	GOARCH=amd64 \
		go build \
		-ldflags "-w -X github.com/mcharriere/gmailctl/cmd/gmailctl.version=${VERSION} -X github.com/mcharriere/gmailctl/cmd/gmailctl.buildDate=${DATE}" \
		-o gmailctl ./cmd/gmailctl/main.go
}

src_install() {
	dobin gmailctl

	default
}
