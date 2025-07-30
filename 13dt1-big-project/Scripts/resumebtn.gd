extends Node

func _on_resume_pressed() -> void:
	var player = get_parent().get_node("Pausable").get_node("Player")
	var tree = get_parent().get_tree()
	queue_free()
	tree.paused = !tree.paused
	player.pause_is = false
