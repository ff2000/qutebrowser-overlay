# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/dwb/dwb-9999.ebuild,v 1.10 2014/06/26 04:41:55 radhermit Exp $

EAPI=5
PYTHON_COMPAT=( python3_4 )

inherit git-r3 toolchain-funcs distutils-r1

EGIT_REPO_URI="https://github.com/The-Compiler/qutebrowser.git"

DESCRIPTION="A keyboard-driven, vim-like browser based on PyQt5 and QtWebKit."
HOMEPAGE="http://qutebrowser.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+doc +jpeg gstreamer"

RDEPEND="
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/pypeg2[${PYTHON_USEDEP}]
	dev-python/PyQt5[printsupport,network,webkit,widgets]
	doc? ( app-text/asciidoc )
	jpeg? ( dev-qt/qtgui:5[jpeg] )
	gstreamer? ( dev-qt/qtwebkit:5[gstreamer] )
"
DEPEND="${RDEPEND}"

python_compile_all() {
	if use doc; then
		python scripts/asciidoc2html.py
	fi
}

python_install_all() {
	distutils-r1_python_install_all
}