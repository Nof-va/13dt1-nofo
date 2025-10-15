extends AnimatableBody3D

const WAITING_TIME = 2
@export var a:= Vector3()
@export var b:= Vector3()
@export var speed: float = 2.0
@export var pause: float = 0.7

func _ready() -> void:
	move()


func move():
	# Animated movement between points A and B
	var move_tween = create_tween()
	move_tween.tween_property(self, "position", b, speed).set_trans(Tween.TRANS_SINE).set_delay(pause)
	move_tween.tween_property(self, "position", a, speed).set_trans(Tween.TRANS_SINE).set_delay(pause)
	await get_tree().create_timer(WAITING_TIME * speed + WAITING_TIME * pause).timeout
	move()
