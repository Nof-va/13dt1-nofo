extends Node


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_startbtn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tut_movement.tscn")


func _on_settingsbtn_pressed() -> void:
	get_tree().change_scene_to_file("settings") # Placeholder allocation


func _on_exitbtn_pressed() -> void:
	get_tree().quit() # Exits game scene
