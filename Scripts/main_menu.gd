extends Control
#@onready var global_state = preload("res://GlobalState.gd").new()
#@onready var settings_scene = preload("res://Settings.tscn").instance()


signal settings_button_pressed

func _ready():
#	print(global_state.get_current_page())
	pass






func _on_cont_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")



func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/NewPlayer.tscn")


func _on_view_control_pressed():
	pass # Replace with function body.


func _on_leader_pressed():
	get_tree().change_scene_to_file("res://Scenes/Leaderboard.tscn")


func _on_settings_pressed() -> void:
	emit_signal("settings_button_pressed")
	#get_tree().change_scene(settings_scene)


func _on_reward_store_pressed():
	get_tree().change_scene_to_file("res://Scenes/Shop.tscn")


func _on_quit_pressed():
	get_tree().quit()
