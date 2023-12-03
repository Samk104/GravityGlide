extends Node


var labels: Array = [] 
@export var initial_sizes: Dictionary = {}
@export_dir var dir_path
@export 
var bus_name: String
@onready var MasterVolSlider= $CanvasLayer/HBoxContainer/HSlider

var bus_index: int 
var _sound_text: Label
var _audio_slider: Slider
var isAudioOn: bool
var _value
var pathofdir ="res://Scenes/"
var ready_called: bool = false 



# Called when the node enters the scene tree for the first time.
func _ready():
	if ready_called:
		return
	ready_called = true
	#collect_labels_from_directory(pathofdir)
	_sound_text = $CanvasLayer/HBoxContainer/Label2
	_audio_slider = $CanvasLayer/HBoxContainer/HSlider
	bus_index = AudioServer.get_bus_index("Master")
	MasterVolSlider.value=AudioServer.get_bus_volume_db(bus_index)
	
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
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	# Store the value for future use
	_value = value

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
	

func _on_text_decrease_pressed():
	#modify_text_size(-2.0
	pass

func _on_normal_text_pressed():
	#reset_text_size()
	pass

func _on_text_increase_pressed():
	#modify_text_size(2.0)
	pass
	
	
#func collect_labels_from_directory(path):
#	var dir := DirAccess.open(path)
#	if dir:
#		dir.list_dir_begin()
#		while true:
#			var file = dir.get_next()
#			if file == "":
#				break
#			var file_path = path + file
#
#			if file.ends_with(".tscn"):
#				var scene_instance = load(file_path).instantiate()  # Use 'instantiate()' in Godot 4.x
#				if scene_instance:
#					collect_labels_from_scene(scene_instance)
#					scene_instance.print_tree() 
#			elif dir.current_is_dir() and not file.begins_with("."):
#				collect_labels_from_directory(file_path)
#
#		dir.list_dir_end()
#		dir.close()

#func collect_labels_from_scene(scene: Node):
#	#print("Collecting labels from scene instance:", scene)
#	if scene:
##		print("Scene instance tree hierarchy:")
##		scene.print_tree()
#		if "UI_Element" in scene.get_tree().get_groups("UI_Element"):
#			for node in scene.get_tree().get_nodes_in_group("UI_Element"):
#				if node is Label:
#					labels.append(node)
#					print(node)
#					initial_sizes[node] = node.rect_min_size
#		else:
#			print("No 'UI_Element' group found in the scene. Skipping.")
#	else:
#		print("Invalid scene instance")
		

#func modify_text_size(delta: float):
#	for label in labels:
#		var current_font_size = label.get("theme_override_font_sizes/font_size")
#		var new_font_size = current_font_size + delta
#
#		# Adjust the height to change font size
#		label.rect_size.y = new_font_size
#
#		# Change font size
#		label.add_font_override("theme_override_font_sizes/font_size", new_font_size) 



#func reset_text_size():
#	for label in labels:
#		var original_font_size = initial_sizes[label].x
#
#		# Reset height to original font size
#		label.rect_size.y = original_font_size
#
#		# Reset font size to original size
#		label.add_font_override("theme_override_font_sizes/font_size", original_font_size)
