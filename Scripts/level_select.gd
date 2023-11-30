extends Control
const LEVEL_BTN=preload("res://Scenes/level_btn.tscn")
@export_dir var dir_path
@onready var grid= $MarginContainer/VBoxContainer/GridContainer



func _ready():
	#Gets directory
	getLevels(dir_path)
func getLevels(path) -> void:
	var dir := DirAccess.open(path)
	#List all the file names and creates a buttun for each
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
		
		
		#creates a buttun places it in the grid veiw and edit the display name
func create_level_btn(level_path:String,level_name:String)-> void:
	var btn = LEVEL_BTN.instantiate()
	btn.text = level_name.trim_suffix(".tscn")
	btn.level_path = level_path
	grid.add_child(btn)
	pass




func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")


func _on_level_select_backbtn_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
