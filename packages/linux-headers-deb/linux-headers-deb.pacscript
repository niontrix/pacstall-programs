pkgname="linux-headers-deb"
gives="linux-headers-6.15.0-061500rc7"
pkgver="6.15~rc7"
buildver="6.15.0-061500rc7.202505182143"
source=("https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/amd64/${gives}_${buildver}_all.deb")
pkgdesc="Ubuntu Linux mainline kernel (Headers)"
sha256sums=("9f60b6c68fa76b3fc1828d5022f439a6cce5e710be83155aea8db3930671ea69")
arch=('all')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
