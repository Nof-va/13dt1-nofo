extends RayCast3D

@onready var raycast = $"."
@export var player : Node
var item: RigidBody3D
var old_parent

func _physics_process(_delta: float) -> void:
	if raycast.is_colliding():
		item = get_collider()
