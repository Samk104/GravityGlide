extends Control
#@onready var global_state = preload("res://GlobalState.gd").new()
#@onready var settings_scene = preload("res://Settings.tscn").instance()


signal settings_button_pressed

func _ready():
#	print(global_state.get_current_page())
	pass

var levelToLoad := ""
func loadLevel(level : String):
	levelToLoad = level
	var LS = preload("res://Scenes/loading_scene.tscn").instantiate()
	add_child(LS)
	var timer := Timer.new()
	add_child(timer)
	timer.timeout.connect(actuallyLoadLevel)
	timer.start(0.2)
func actuallyLoadLevel():
	get_tree().change_scene_to_file(levelToLoad)




func _on_cont_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")



func _on_new_game_pressed():
	loadLevel("res://Levels/world.tscn")
	#get_tree().change_scene_to_file("res://Levels/world.tscn")


func _on_view_control_pressed():
	get_tree().change_scene_to_file("res://Scenes/Help.tscn")
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")
	


func _on_reward_store_pressed():
	get_tree().change_scene_to_file("res://Scenes/Shop.tscn")


func _on_quit_pressed():
	GlobalAudio.stop_music()
	get_tree().quit()
