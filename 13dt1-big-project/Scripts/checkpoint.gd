extends Area3D

@export var checkpoint_animator : AnimationPlayer
@export var respawn_point : Marker3D


func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		Global.spawn_point = respawn_point.global_position
		await get_tree().create_timer(0.3).timeout
		checkpoint_animator.play("checkpoint_reached")
