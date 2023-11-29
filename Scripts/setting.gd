extends Node

var isSoundOn = true
var textSizeInPoints = 12
var contrastLevel = 1.0
@onready var global_state = preload("res://Scripts/GlobalState.gd").new()
signal settings_button_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func toggleSound():
	isSoundOn = !isSoundOn
	


func _on_check_button_toggled():
	#button_pressed)
	pass # Replace with function body.


func _on_h_slider_value_changed():
	#value
	pass # Replace with function body.


func _on_button_pressed():
	emit_signal("settings_button_pressed")
	var previous_page = global_state.get_current_page()
	global_state.set_current_page("")  # Reset current page
	get_tree().change_scene(previous_page)
	queue_free()
