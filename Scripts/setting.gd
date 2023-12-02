extends Node

@export
var bus_name: String

@onready var MasterVolSlider= $CanvasLayer/HBoxContainer/HSlider
var bus_index: int 
var _sound_text: Label
var _audio_slider: Slider
var isAudioOn: bool
var _value



# Called when the node enters the scene tree for the first time.
func _ready():
	bus_index = AudioServer.get_bus_index("Master")
	MasterVolSlider.value=AudioServer.get_bus_volume_db(bus_index)
	print(bus_index)
	_sound_text = $CanvasLayer/HBoxContainer/Label2
	_audio_slider = $CanvasLayer/HBoxContainer/HSlider
	_enable_audio_feature()

func _on_check_button_toggled(_button_pressed):
	if _button_pressed == false:
		print("false")
		_disable_audio_feature()
	else: 
		print("true")
		_enable_audio_feature()

func _disable_audio_feature():
	_audio_slider.set_process_input(false)
	_audio_slider.editable = false
	_sound_text.modulate = Color(1, 1, 1, .05)
	GlobalAudio.stop_music()

func _enable_audio_feature():
	_audio_slider.set_process_input(true)
	_audio_slider.editable = true
	_sound_text.modulate = Color(250, 250, 1)
	GlobalAudio.play_music()

func _on_h_slider_value_changed(value):
	print("Slider value changed:", value)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


	# Store the value for future use
	_value = value

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_text_decrease_pressed():
	pass # Replace with function body.

func _on_normal_text_pressed():
	pass # Replace with function body.

func _on_text_increase_pressed():
	pass # Replace with function body.
