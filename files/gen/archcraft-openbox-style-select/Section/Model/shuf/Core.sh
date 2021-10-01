

################################################################################
### Head: Model mod_style_select_shuf
##

mod_style_select_shuf () {

	##local target_dir_path="$1"
	local target_dir_path="$THE_STYLE_DEFAULT_DIR_PATH"
	local target_name="$(sys_style_select_shuf_by_dir $target_dir_path)"

	mod_style_select_set "$target_name"
}

##
### Tail: Model mod_style_select_shuf
################################################################################
