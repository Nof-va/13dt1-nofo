extends Node3D

@export var raycast : RayCast3D
@export var door_animator : AnimatableBody3D
@export var key_place : Marker3D
var door_open = false
var collider


func _physics_process(_delta: float) -> void:
	
	if raycast.is_colliding():
		collider = raycast.get_collider()
		
		if collider.is_in_group("Moveable"):
			collider.position = key_place.global_position
			if door_open == false:
				door_animator.open()
				door_open = true
		
	elif door_open == true:
			door_animator.close()
			door_open = false
	
