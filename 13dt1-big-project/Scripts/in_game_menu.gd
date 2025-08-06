extends Node

func _on_resume_pressed() -> void:
	var player = get_parent().get_node("Pausable").get_node("Player")
	var tree = get_parent().get_tree()
	queue_free()
	tree.paused = !tree.paused
	player.pause_is = false


func _on_exitbtn_pressed() -> void:
	get_tree().quit()


func _on_checkpointbtn_pressed() -> void:
	var player = get_parent().get_node("Pausable").get_node("Player")
	var tree = get_parent().get_tree()
	tree.paused = !tree.paused
	player.pause_is = false
	player.position = Global.spawn_point
	queue_free()


func _on_restartbtn_pressed() -> void:
	var player = get_parent().get_node("Pausable").get_node("Player")
	var tree = get_parent().get_tree()
	tree.reload_current_scene()
	tree.paused = !tree.paused
	player.pause_is = false
