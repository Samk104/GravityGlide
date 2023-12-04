extends Node




func _on_h_slider_value_changed(value):
	GlobalWorldEnvironment.environment.adjustment_brightness=value
	pass # Replace with function body.


func _on_contrast_value_changed(value):
	GlobalWorldEnvironment.environment.adjustment_contrast=value
	pass # Replace with function body.


func _on_saturation_value_changed(value):
	GlobalWorldEnvironment.environment.adjustment_saturation=value
	pass # Replace with function body.
