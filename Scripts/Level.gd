extends Node2D

@export var levelIndex : int = 0
@export var nextLevelPath : String = "res://Scenes/main_menu.tscn"
var time : int = 0

func _ready():
	time = Time.get_ticks_msec()

func death():
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	#TODO: GAME OVER SCREEN?

func onPitfall(body):
	if body.name == "Player":
		death()

func onLevelClear(body):
	if body.name == "Player":
		$Player.queue_free() # Remove player so no hijinx occurs.
		
		# Create and initalize the EndScreen
		var CL = CanvasLayer.new()
		var ES = preload("res://Scenes/EndScreen.tscn").instantiate()
		add_child(CL)
		CL.add_child(ES)
		ES.setUp((Time.get_ticks_msec()-time)/1000, levelIndex, nextLevelPath)
