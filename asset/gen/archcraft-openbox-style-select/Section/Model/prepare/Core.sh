

################################################################################
### Head: Model mod_style_select_prepare
##

mod_style_select_prepare () {
	#echo "mod_style_select_prepare"
	#echo "$@"

	# archcraft-openbox-style-select manjaro_prepare

	mod_style_select_prepare_install_package

}


mod_style_select_prepare_install_package () {

	util_error_echo "sudo pacman -Sy --needed fzf ueberzug"
	sudo pacman -Sy --needed fzf ueberzug

}

##
## * https://discover.manjaro.org/packages/fzf
## * https://archlinux.org/packages/community/x86_64/fzf/
## * https://archlinux.org/packages/community/x86_64/ueberzug/
##

##
### Tail: Model mod_style_select_prepare
################################################################################
