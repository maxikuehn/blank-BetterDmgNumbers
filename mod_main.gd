extends Node


const AUTHORNAME_MODNAME_DIR := "blank-BetterDmgNumbers"
const AUTHORNAME_MODNAME_LOG_NAME := "blank-BetterDmgNumbers:Main"

var mod_dir_path := ""
var extensions_dir_path := ""


func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(AUTHORNAME_MODNAME_DIR)
	install_script_extensions()

func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.plus_file("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("visual_effects/floating_text/floating_text_manager.gd"))


func _ready() -> void:
	ModLoaderLog.info("Ready!", AUTHORNAME_MODNAME_LOG_NAME)
