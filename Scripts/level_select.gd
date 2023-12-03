extends Control
const LEVEL_BTN=preload("res://Scenes/level_btn.tscn")
@export_dir var dir_path
@onready var grid= $MarginContainer/VBoxContainer/GridContainer

var clicked_button = ""
var pathToLoad = ""
#
#func _ready():
#	#Gets directory
#	getLevels(dir_path)
#
#func getLevels(path) -> void:
#	var dir := DirAccess.open(path)
#	#List all the file names and creates a buttun for each
#	if dir:
#		dir.list_dir_begin()
#		var file_name= dir.get_next()
#		while file_name != "":
#			print(file_name)
#			create_level_btn('%s/%s'% [dir.get_current_dir(),file_name],file_name)
#			file_name=dir.get_next()
#		dir.list_dir_end()
#	else:
#		print('Error occured when accessing the path')
##
##
##		#creates a buttun places it in the grid veiw and edit the display name
#func create_level_btn(level_path:String,level_name:String)-> void:
#	var btn = LEVEL_BTN.instantiate()
#	btn.text = level_name.trim_suffix(".tscn").replace("_"," ")
#	btn.level_path = level_path
#	grid.add_child(btn)
#




func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")

func _on_level_select_backbtn_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func loadLevel():
	var LS = preload("res://Scenes/loading_scene.tscn").instantiate()
	add_child(LS)
	var timer := Timer.new()
	add_child(timer)
	timer.timeout.connect(actuallyLoadLevel)
	timer.start(0.2)

func actuallyLoadLevel():
	get_tree().change_scene_to_file(pathToLoad)


func _on_level_1_pressed():
	loadLevel()
	clicked_button = "world.tscn"
	pathToLoad = "res://Levels/world.tscn"

func _on_level_2_pressed():
	loadLevel()
	clicked_button = "Level_2.tscn"
	pathToLoad = "res://Levels/Level_2.tscn"

func _on_level_3_pressed():
	loadLevel()
	clicked_button = "Level_3.tscn"
	pathToLoad = "res://Levels/Level_3.tscn"

func _on_level_4_pressed():
	loadLevel()
	clicked_button = "Level_4.tscn"
	pathToLoad = "res://Levels/Level_4.tscn"

func _on_level_5_pressed():
	loadLevel()
	clicked_button = "Level_5.tscn"
	pathToLoad = "res://Levels/Level_5.tscn"

func _on_level_6_pressed():
	loadLevel()
	clicked_button = "Level_6.tscn"
	pathToLoad = "res://Levels/Level_6.tscn"
	
func _on_level_7_pressed():
	loadLevel()
	clicked_button = "Level_7.tscn"
	pathToLoad = "res://Levels/Level_7.tscn"

func _on_level_8_pressed():
	loadLevel()
	clicked_button = "Level_8.tscn"
	pathToLoad = "res://Levels/Level_8.tscn"

func _on_level_9_pressed():
	loadLevel()
	clicked_button = "Level_9.tscn"
	pathToLoad = "res://Levels/Level_9.tscn"

func _on_level_10_pressed():
	loadLevel()
	clicked_button = "Level_10.tscn"
	pathToLoad = "res://Levels/Level_10.tscn"
