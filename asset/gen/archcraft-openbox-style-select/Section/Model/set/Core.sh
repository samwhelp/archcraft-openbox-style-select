

################################################################################
### Head: Model mod_style_select_set
##

mod_style_select_set () {
	#echo "mod_style_select_set"
	#echo "$@"


	##
	# ## Example:
	# $ archcraft-openbox-style-select set "/usr/share/backgrounds/xfce/palm-wave.jpg"
	# $ archcraft-openbox-style-select set "/usr/share/backgrounds/xfce/palm-wave.jpg" scale
	##

	local choose_dir_path="$THE_STYLE_DEFAULT_DIR_PATH"
	local choose_file_name="${1}.sh"
	local choose_file_path="$choose_dir_path/$choose_file_name"
	local target_file_path


	if ! target_file_path="$(sys_style_check_file_exist $choose_file_path)"; then
		util_error_echo
		util_error_echo "## Style Script Not Exist: "
		util_error_echo
		util_error_echo "$choose_file_path"
		util_error_echo
		return 1
	fi


	if [ -x "$target_file_path" ]; then

		util_error_echo "## mod_style_select_set"
		util_error_echo
		util_error_echo "$target_file_path"
		util_error_echo

		"$target_file_path"
	fi



}


##
### Tail: Model mod_style_select_set
################################################################################
