extends Node3D

@export var player: Scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if player.position < 0:
		Countlives.lives -1
	
	if Countlives.lives -1:
		get_tree().reload_current_scene()
