extends Button

func _on_pressed() -> void:
	get_parent().get_parent().get_parent().queue_free()
	var tree = get_parent().get_parent().get_parent().get_parent().get_tree()
	tree.paused = !tree.paused
