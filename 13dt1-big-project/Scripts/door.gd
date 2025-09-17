extends Area3D

@export var animator : AnimatableBody3D

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Moveable"):
		animator.open()


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Moveable"):
		animator.close()
