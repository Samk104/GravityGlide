extends Control
const LEVEL_BTN=preload("res://level_btn.tscn")
@export_dir var dir_path
@onready var grid= $MarginContainer/VBoxContainer/GridContainer

#@onready var global_state = preload("res://GlobalState.gd").new()


func _ready():
	getLevels(dir_path)
	#print(global_state.get_current_page())

func getLevels(path) -> void:
	var dir := DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name= dir.get_next()
		while file_name != "":
			print(file_name)
			create_level_btn('%s/%s'% [dir.get_current_dir(),file_name],file_name)
			file_name=dir.get_next()
		dir.list_dir_end()
	else:
		print('Error occured when accessing the path')
		
		
func create_level_btn(level_path:String,level_name:String)-> void:
	var btn = LEVEL_BTN.instantiate()
	btn.text = level_name.trim_suffix(".tscn")
	btn.level_path = level_path
	grid.add_child(btn)
	pass


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Settings.tscn")


func _on_level_select_backbtn_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
