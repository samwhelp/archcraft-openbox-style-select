
################################################################################
### Head: Sys / Fzf
##


sys_fzf_style_preview_text () {

	local style_name="$1"
	local file_name="${style_name}.sh"
	local dir_path="$THE_CWD_PATH"

	echo
	printf "## Info\n"
	echo
	#printf "File: %s\n" "$file_name"
	#printf "Dir: %s\n" "$dir_path"
	#printf "Path: %s\n" "$dir_path/$file_name"
	printf "Script: %s\n" "$dir_path/$file_name"
	echo
}

sys_fzf_style_preview_image_remove () {
	util_error_echo
	util_error_echo "## sys_fzf_style_preview_image_remove"

	local thumb_id="style"

	{
		printf '{'
		printf '"identifier": "%s",' "$thumb_id"
		printf '"action": "remove"'
		printf '}\n'

	} > "$THE_UEBERZUG_CTRL"
}


sys_fzf_style_preview_image () {

	local thumb_x=1
	local thumb_y=10
	local thumb_width=15
	local thumb_height=20

	#local thumb_dir_path="$THE_CWD_PATH"
	local thumb_dir_path="$THE_STYLE_ASSET_DIR_PATH"
	local thumb_id="style"
	local style_name="$1"
	local thumb_file_path="$thumb_dir_path/$style_name/screenshot/thumb.png"

	if ! [ -a "$thumb_file_path" ]; then
		thumb_file_path="$THE_STYLE_ASSET_SYS_DIR_PATH/$style_name/screenshot/thumb.png"
	fi

	printf "Thumb: %s\n" "$thumb_file_path"

	{
		printf '{'

		printf '"identifier": "%s",' "$thumb_id"
		printf '"path": "%s",' "$thumb_file_path"
		printf '"x": %d,' "$thumb_x"
		printf '"y": %d,' "$thumb_y"
		printf '"width": %d,' "$thumb_width"
		printf '"height": %d,' "$thumb_height"
		printf '"scaler": "fit_contain",'

		printf '"action": "add"'
		printf '}\n'

	} > "$THE_UEBERZUG_CTRL"
}


sys_fzf_style_preview_main () {
	sys_fzf_style_preview_text "$1"
	sys_fzf_style_preview_image "$1"
}


##
### Tail: Sys / Fzf
################################################################################
