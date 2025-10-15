extends CanvasLayer

@export var main_menu: String
@export var pause_menu: CanvasLayer
var currently_paused = false
@onready var player = $"../Player"
@onready var tree = get_tree()

func _ready() -> void:
	pause_menu.visible = false


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		if currently_paused == false:
			pause_menu.visible = true
			tree.paused = !tree.paused
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			currently_paused = true
		else:
			pause_menu.visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			tree.paused = !tree.paused
			currently_paused = false


func _on_resume_pressed() -> void:
	tree.paused = !tree.paused
	pause_menu.visible = false
	currently_paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_exitbtn_pressed() -> void:
	get_tree().quit()


func _on_main_menubtn_pressed() -> void:
	tree.paused = !tree.paused
	get_tree().change_scene_to_file("res://Scenes/" + main_menu)


func _on_restartbtn_pressed() -> void:
	tree.reload_current_scene()
	tree.paused = !tree.paused
