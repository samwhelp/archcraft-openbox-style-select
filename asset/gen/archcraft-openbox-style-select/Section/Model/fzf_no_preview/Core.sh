

################################################################################
### Head: Model fzf_no_preview
##

mod_fzf_no_preview () {
	#echo "mod_fzf_no_preview"
	#echo "$@"

	if ! is_command_exist 'fzf'; then

		util_error_echo '## Need: fzf'
		util_error_echo '# * https://github.com/junegunn/fzf'
		util_error_echo
		util_error_echo '## Archcraft Install:'
		util_error_echo '# $ sudo pacman -Sy fzf ueberzug'
		util_error_echo
		util_error_echo '## Manjaro Install:'
		util_error_echo '# $ pamac install fzf ueberzug'
		util_error_echo
		util_error_echo '## Ubuntu Install:'
		util_error_echo '# $ sudo apt-get install fzf ueberzug'
		util_error_echo

		return 1
	fi


	#local choose_dir_path="$1"
	local choose_dir_path="$THE_STYLE_DEFAULT_DIR_PATH"

	local selected="$(sys_style_select_list_by_dir "$choose_dir_path" | fzf)"

	util_error_echo
	util_error_echo "## Selected: $selected"
	util_error_echo

	if [ "none$selected" = "none" ]; then
		return 1
	fi

	mod_style_select_set "$selected"

}

##
### Tail: Model fzf_no_preview
################################################################################
