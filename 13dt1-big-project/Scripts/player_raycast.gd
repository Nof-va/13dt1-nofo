extends RayCast3D

@export var raycast : Node
var item : RigidBody3D
var old_parent


func _physics_process(delta: float) -> void:
	if raycast.is_colliding():
		item = get_collider()
		old_parent = item.get_parent()
		if Input.is_action_just_pressed("left_click"):
			item.reparent(raycast)
			item.freeze_mode = RigidBody3D.FREEZE_MODE_KINEMATIC
			item.freeze = true
			if Input.is_action_just_released("left_click"):
				item.reparent(old_parent)
				item.freeze = false
