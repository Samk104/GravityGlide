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
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	#TODO: MCLAIN - CHANGE TO GAME OVER SCREEN
