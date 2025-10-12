extends AnimatableBody3D

@export var a := Vector3()
@export var b := Vector3()
@export var time : float = 5.0
@export var pause : float = 1

func _ready() -> void:
	move()


func move():
	var move_tween = create_tween()
	move_tween.tween_property(self, "position", b, time).set_trans(Tween.TRANS_SINE).set_delay(pause)
	move_tween.tween_property(self, "position", a, time).set_trans(Tween.TRANS_SINE).set_delay(pause)
	await get_tree().create_timer(1.5 * time + 1.5 * pause).timeout
	move()
