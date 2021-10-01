

################################################################################
### Head: Sys / Style
##

sys_style_check_file_exist () {

	local target="$1"

	if [ "none$target" = "none" ]; then
		target="$THE_STYLE_DEFAULT_FILE_PATH"
	fi

	if [ -f "$target" ]; then
		echo "$target"
		return 0
	fi

	return 1

}


sys_style_check_dir_exist () {

	local target="$1"

	if [ "none$target" = "none" ]; then
		target="$THE_STYLE_DEFAULT_DIR_PATH"
	fi

	if [ -d "$target" ]; then
		echo "$target"
		return 0
	fi

	return 1

}

sys_style_check_target_dir_exist () {

	local target="$1"

	if [ "none$target" = "none" ]; then
		return 1
	fi

	if [ -d "$target" ]; then
		echo "$target"
		return 0
	fi

	return 1

}


sys_style_init_target_dir () {

	local target="$1"

	if [ "none$target" = "none" ]; then
		return 0
	fi

	if [ -f "$target" ]; then
		return 0
	fi

	mkdir -p "$target"

}



sys_style_select_list_by_dir () {
	#echo "sys_style_select_list_by_dir"
	#echo "$@"

	## archcraft-openbox-style-select list
	## archcraft-openbox-style-select list /usr/share/backgrounds
	local file_name=''

	local choose="$1"
	local target


	if ! target="$(sys_style_check_dir_exist $choose)"; then
		util_error_echo "## Dir Not Exist: "
		util_error_echo
		util_error_echo "$choose"
		return 1
	fi

	cd "$target"


	for file_name in $(ls ./ -1); do
	#for name in *; do
		if [ -d "$file_name" ]; then
			continue;
		fi

		#echo $file_name;
		echo "${file_name:0:-3}"
	done

	cd "$OLDPWD"

}

sys_style_select_shuf_by_dir () {
	#echo "mod_style_select_shuf_file_path"
	#echo "$@"

	##
	# ## Example:
	# $ style-select-feh shuf_file_path
	# $ style-select-feh shuf_file_path /usr/share/backgrounds
	# $ style-select-feh shuf_file_path ~/Pictures
	##

	local choose_dir_path="$1"
	local target_dir_path

	if [ "none" = "none$choose_dir_path" ]; then
		choose_dir_path="$(pwd)"
	fi


	if ! target_dir_path="$(sys_style_check_dir_exist $choose_dir_path)"; then
		util_error_echo
		util_error_echo "## Dir Not Exist: "
		util_error_echo
		util_error_echo "$choose_dir_path"
		util_error_echo
		return 1
	fi


	local target_name="$(sys_style_select_list_by_dir $target_dir_path | shuf -n 1)"

	echo "$target_name"

}


##
### Tail: Sys / Style
################################################################################
