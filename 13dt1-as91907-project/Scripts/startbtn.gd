extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



#Called when button is pressed
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/gameplay.tscn") # Transports user from current scene to gameplay scnene
