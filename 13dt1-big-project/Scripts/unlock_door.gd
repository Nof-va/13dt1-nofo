extends Node3D


@export var raycast : RayCast3D
@export var key_place : Marker3D
@export var door : Node3D
var collider


func _physics_process(_delta: float) -> void:
		
		
	if raycast.is_colliding():
		collider = raycast.get_collider()
		
		if collider.is_in_group("Moveable"):
			#collider.position = key_place.global_position
			if door.door_open == false:
				door.door_animator.open()
				door.door_open = true
		
	elif door.door_open == true:
			door.door_animator.close()
			door.door_open = false
