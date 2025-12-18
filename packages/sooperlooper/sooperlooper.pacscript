pkgname="sooperlooper"
gives="sooperlooper"
breaks=("${gives}")
pkgver="1.7.8"
pkgdesc="SooperLooper is a live looping sampler capable of immediate loop recording, overdubbing, multiplying, reversing and more."
arch=("i386" "amd64")
url="http://essej.net/sooperlooper/"
depends=(
  "libgcc-s1"
  "libc6-dev"
  "liblo7"
)
makedepends=(
  "libasound-dev"
  "autoconf-archive"
  "imagemagick"
  "libjack-dev"
  "libsigc++-2.0-dev"
  "libwxgtk3.0-gtk3-dev"
  "autopoint"
  "liblo-dev"
  "libsamplerate0-dev"
  "libsndfile1-dev"
  "libxml2-dev"
  "libncurses-dev"
  "librubberband-dev"
)
optdepends=(
  "pipewire-audio-client-tools: needed when using pipewire"
  "libjack-jackd2-0: needed when using pipewire"
  "jack-tools: needed when using jack"
  "jackd: the jack daemon"
  "qjackctl: graphical interface to manage jackd audio sources"
  "qpwgraph: essential graph manager when using PipeWire"
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/essej/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("875d9fd88a1d1646572ea32585b18e78fd1fa96566869ab9921756c62de1f224befceb80b8d11a3efdf3c8860ac63f5f18d64d8d2a8132219d47cf0a37be8bfe")

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  convert doc/html/sl_web_logo_black.png \
    -resize 128x128\> \
    -size 128x128 xc:black +swap \
    -gravity center \
    -composite net.essej.sooperlooper.png
  cat > sooperlooper.desktop << "EOF"
[Desktop Entry]
Type=Application
Name=SooperLooper
Comment=Live Looping Sampler
Exec=sooperlooper
Icon=sooperlooper
Terminal=false
Categories=Audio;AudioVideo;
EOF
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -vDm 644 *.desktop -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 net.essej.sooperlooper.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
}
