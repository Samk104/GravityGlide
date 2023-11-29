extends Control

var leaderboard = Leaderboard.new()

func _ready():
	leaderboard.getStarCount()

func backButton():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
