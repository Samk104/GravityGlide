extends Node

var current_page : String = ""

func _ready():
	set_process(false)

func set_current_page(page: String) -> void:
	current_page = page

func get_current_page() -> String:
	return current_page
