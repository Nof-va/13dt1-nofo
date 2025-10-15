extends Node

@export var start_scene: PackedScene
@export var settings_scene: PackedScene

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_startbtn_pressed() -> void:
	get_tree().change_scene_to_packed.bind(start_scene).call_deferred()


func _on_settingsbtn_pressed() -> void:
	get_tree().change_scene_to_packed.bind(settings_scene).call_deferred()


func _on_exitbtn_pressed() -> void:
	get_tree().quit() # Exits game scene
