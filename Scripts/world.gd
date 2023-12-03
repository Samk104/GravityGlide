extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_level_complete_body_entered(body):
	if body.name == "Player":
		death()

func death():
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	#TODO: MCLAIN - CHANGE TO GAME OVER SCREEN


func _on_end_game_6_body_entered(body):
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_end_game_5_body_entered(body):
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_end_game_4_body_entered(body):
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_end_game_3_body_entered(body):
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_end_game_2_body_entered(body):
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")



func _on_end_game_body_entered(body):
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
