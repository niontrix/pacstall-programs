pkgname="qpwgraph"
gives="qpwgraph"
breaks=("${gives}")
pkgver="0.9.7"
pkgdesc="qpwgraph is a graph manager dedicated to PipeWire, using the Qt C++ framework, based and pretty much like the same of QjackCtl."
maintainer="Tobias Heinlein niontrix@mailbox.org"
arch=("amd64")
url="https://gitlab.freedesktop.org/rncbc/qpwgraph"
makedepends=(
  "cmake"
  "qt6-base-dev>=6.1 | qtbase5-dev>=5.1"
  "qt6-base-dev-tools>=6.1 | qtbase5-dev-tools>=5.1"
  "qt6-tools-dev>=6.1 | qttools5-dev>=5.1"
  "qt6-tools-dev-tools>=6.1 | qttools5-dev-tools>=5.1"
  "qt6-l10n-tools>=6.1 | base-files<<12"
  "qt6-svg-dev | libqt6svg6-dev | libqt5svg5-dev"
  "libxkbcommon-dev"
  "libgl-dev"
  "libasound2-dev"
  "libpipewire-0.3-dev"
)
source=("https://gitlab.freedesktop.org/rncbc/qpwgraph.git#tag=${pkver}")

prepare() {
  cd "${pkgname}-{pkgver}"
  cat > qpwgraph.desktop << "EOF"
[Desktop Entry]
Type=Application
Name=qpwgraph
Comment=Graph manager dedicated to PipeWire
Exec=qpwgraph
Icon=qpwgraph
Terminal=false
Categories=Audio;AudioVideo;
EOF
}

build() {
  cd "${pkgname}"
  cmake -B build
  cmake --build build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
  install -vDm 644 *.desktop -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 src/images/qpwgraph.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
}
