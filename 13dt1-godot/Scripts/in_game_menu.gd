extends Node

@onready var player = $"../Player"
@onready var tree = get_tree()
var currently_paused = false

func _ready() -> void:
	$".".visible = false


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		if currently_paused == false:
			$".".visible = true
			tree.paused = !tree.paused
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			currently_paused = true
		else:
			$".".visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			tree.paused = !tree.paused
			currently_paused = false

func _on_resume_pressed() -> void:
	tree.paused = !tree.paused
	$".".visible = false
	currently_paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_exitbtn_pressed() -> void:
	get_tree().quit()


func _on_checkpointbtn_pressed() -> void:
	tree.paused = !tree.paused
	player.position = Global.spawn_point
	$".".visible = false
	currently_paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_restartbtn_pressed() -> void:
	tree.reload_current_scene()
	tree.paused = !tree.paused
