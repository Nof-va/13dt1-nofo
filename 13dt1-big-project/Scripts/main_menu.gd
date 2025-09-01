extends Node

@export var play : PackedScene
@export var settings : PackedScene

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_startbtn_pressed() -> void:
	get_tree().change_scene_to_packed(play) # Transports user from current scene to gameplay scene


func _on_settingsbtn_pressed() -> void:
	get_tree().change_scene_to_packed(settings) # Placeholder allocation


func _on_exitbtn_pressed() -> void:
	get_tree().quit() # Exits game scene
