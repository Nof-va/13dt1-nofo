extends Node3D

@export var raycast : RayCast3D
@export var key_place : Marker3D
@export var door : Node3D
var collider


func _physics_process(_delta: float) -> void:
	# Check if key item has been placed on the unlocking mechanism
	if raycast.is_colliding():
		collider = raycast.get_collider()
		# Opens door if item is the key item
		if collider.is_in_group("Moveable"):
			if door.door_open == false:
				door.door_animator.open()
				door.door_open = true
		
		# If key item is removed the door will close
	elif door.door_open == true: 
			door.door_animator.close()
			door.door_open = false
