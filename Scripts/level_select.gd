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
#	else:
#		print('Error occured when accessing the path')
#
#
#		#creates a buttun places it in the grid veiw and edit the display name
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





func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Levels/world.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Levels/Level_2.tscn")




func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://Levels/Level_4.tscn")


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Levels/Level_3.tscn")


func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://Levels/Level_5.tscn")
	


func _on_level_6_pressed():
	get_tree().change_scene_to_file("res://Levels/Level_6.tscn")


func _on_level_8_pressed():
	get_tree().change_scene_to_file("res://Levels/Level_8.tscn")


func _on_level_7_pressed():
	pass # Replace with function body.
