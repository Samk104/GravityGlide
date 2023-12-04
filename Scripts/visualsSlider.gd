extends Node

func _ready():
	# Connect signals to functions
	$HSlider.connect("value_changed", _on_h_slider_value_changed)
	$contrast.connect("value_changed", _on_contrast_value_changed)
	$saturation.connect("value_changed", _on_saturation_value_changed)
	$Button2.connect("pressed", _on_button_2_pressed)

func _on_h_slider_value_changed(value):
	GlobalWorldEnvironment.environment.adjustment_brightness = value

func _on_contrast_value_changed(value):
	GlobalWorldEnvironment.environment.adjustment_contrast = value

func _on_saturation_value_changed(value):
	GlobalWorldEnvironment.environment.adjustment_saturation = value

func _on_button_2_pressed():
	# Set slider values and adjust environment settings
	$HSlider.value = 1
	_on_h_slider_value_changed(1)

	$contrast.value = 1
	_on_contrast_value_changed(1)

	$saturation.value = 1
	_on_saturation_value_changed(1)
