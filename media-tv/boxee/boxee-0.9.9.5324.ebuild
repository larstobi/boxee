# Copyright 2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils autotools

DESCRIPTION="Boxee is a freeware cross-platform media center software"
HOMEPAGE="www.boxee.tv"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		sys-devel/automake
		sys-libs/zlib
		media-libs/libogg
		app-arch/unzip
		media-libs/freetype
		net-misc/curl
		sys-apps/gawk
		dev-util/gperf
		dev-libs/fribidi
		dev-libs/lzo
		media-libs/alsa-lib
		media-libs/glew
		dev-libs/libpcre
		dev-lang/nasm
		app-i18n/enca
		dev-libs/popt
		virtual/mysql
		sys-devel/libtool
		media-libs/libpng
		dev-libs/boost
		dev-util/cmake
		x11-libs/libXt
		dev-db/sqlite
		media-libs/libvorbis
		media-libs/jpeg
		x11-proto/xineramaproto
		x11-libs/libXrender
		sys-apps/hal
		media-libs/libmad
		media-libs/fontconfig
		media-libs/faac
		sys-devel/gcc
		x11-libs/libXrandr
		dev-python/pysqlite
		x11-libs/libXinerama
		sys-apps/pmount
		dev-util/subversion
		media-libs/jasper
		x11-libs/libXmu
		media-libs/libsdl
		dev-libs/tre
		media-libs/sdl-image
		media-libs/sdl-gfx
		media-libs/sdl-mixer
		media-libs/sdl-sound
		"

src_unpack() {
	unpack ${P}.tar.bz2
	cd ${S}
	epatch ${FILESDIR}/CharsetConverter.h.patch
	epatch ${FILESDIR}/ArabicShaping.h.patch
	epatch ${FILESDIR}/FileCurl.cpp.patch
	epatch ${FILESDIR}/FileSmb.cpp.patch
	epatch ${FILESDIR}/tiff-fPIC.patch
	eautoreconf
}

src_compile() {
	econf || die "configure failed"
	emake || die "make failed"
}

src_install() {
	einstall INSTALL_ROOT="${D}" || die "install failed"
	dodoc README.linux LICENSE.GPL
}
