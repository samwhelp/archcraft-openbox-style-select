

################################################################################
### Head: Model fzf
##

mod_fzf () {
	#echo "mod_fzf"
	#echo "$@"


	##local choose_dir_path="$1"
	local choose_dir_path="$THE_STYLE_DEFAULT_DIR_PATH"
	local target_dir_path


	if ! target_dir_path="$(sys_style_check_dir_exist $choose_dir_path)"; then
		util_error_echo
		util_error_echo "## Dir Not Exist: "
		util_error_echo
		util_error_echo "$choose_dir_path"
		util_error_echo "$target_dir_path"
		util_error_echo
		return 1
	fi



	mod_fzf_ses_start "$target_dir_path"



}


mod_fzf_app_start () {

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


	local choose_dir_path="$1"

	local PREVIEW_SIDE="left"

	#export THE_CWD_PATH="$(pwd)"


	export THE_CWD_PATH="$choose_dir_path"



	#local preview_app="$0 _fzf_preview_area"
	local preview_app="DEBUG_STYLE_SELECT=false $0 _fzf_preview_area"


	local selected="$(sys_style_select_list_by_dir "$choose_dir_path" | fzf --preview "$preview_app {}" --preview-window "$PREVIEW_SIDE:50%:noborder:wrap")"

	local selected_file_path="$choose_dir_path/$selected"

	util_error_echo
	util_error_echo "## Selected: $selected"
	util_error_echo "## Selected File Path: $selected_file_path"

	sys_fzf_style_preview_image_remove
	util_error_echo

	if [ "none$selected" = "none" ]; then
		return 1
	fi

	mod_style_select_set "$selected"


}

mod_fzf_ses_start () {
	trap sys_ueberzug_ses_stop EXIT QUIT INT TERM
	sys_ueberzug_ses_start "$@"
	mod_fzf_app_start "$@"
}

##
### Tail: Model fzf
################################################################################
