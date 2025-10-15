extends AnimatableBody3D

@export var a:= Vector3()
@export var b:= Vector3()
@export var time: float = 2.0

func open():
	var move_tween = create_tween()
	move_tween.tween_property(self, "position", b, time).set_trans(Tween.TRANS_SINE)


func close():
	var move_tween = create_tween()
	move_tween.tween_property(self, "position", a, time).set_trans(Tween.TRANS_SINE)
