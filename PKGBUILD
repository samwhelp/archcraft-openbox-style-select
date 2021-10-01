
##
## * https://wiki.archlinux.org/title/Arch_User_Repository
## * https://archlinux.org/groups/x86_64/base-devel/
## * https://wiki.archlinux.org/title/pacman
## * https://wiki.archlinux.org/title/PKGBUILD
##

pkgname=archcraft-openbox-style-select
pkgver=0.1
pkgrel=1
pkgdesc="Style Select Tool for Archcraft Openbox."
url="https://github.com/samhelp/archcraft-openbox-style-select"
arch=('any')
license=('MIT')
makedepends=()
#depends=()
depends=('archcraft-openbox' 'fzf' 'ueberzug')
#depends=('archcraft-openbox')
#optdepends=('fzf: fzf list' 'ueberzug: fzf image preview')
conflicts=()
provides=("${pkgname}")
options=(!strip !emptydirs)

prepare() {
	cp -af ../files/. "${srcdir}"
}


package() {

	## Path
	local sys_bin_dir_path="${pkgdir}/usr/bin"
	local sys_share_dir_path="${pkgdir}/usr/share/${pkgname}"
	#local sys_share_style_dir_path="${sys_share_dir_path}/style"
	local sys_bash_completion_dir_path="${pkgdir}/usr/share/bash-completion/completions"
	local sys_bash_completion_file_path="${sys_bash_completion_dir_path}/archcraft-openbox-style-select"

	## prepare share dir
	mkdir -p "$sys_share_dir_path"
	#mkdir -p "$sys_bash_completion_dir_path"

	## install main script
	## /usr/bin/archcraft-openbox-style-select
	install -Dm755 "${srcdir}/${pkgname}" "${sys_bin_dir_path}/${pkgname}"

	## install share files
	## /usr/share/archcraft-openbox-style-select/style
	cp -ru "${srcdir}/share/style" "${sys_share_dir_path}/"

	## install bash-completion
	## /completion/bash/archcraft-openbox-style-select
	install -Dm644 "${srcdir}/completion/bash/archcraft-openbox-style-select" "${sys_bash_completion_file_path}"
}
