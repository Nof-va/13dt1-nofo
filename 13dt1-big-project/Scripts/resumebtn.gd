extends Node

func _on_pressed() -> void:
	var tree = get_parent().get_tree()
	queue_free()
	tree.paused = !tree.paused
