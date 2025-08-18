extends RayCast3D

@onready var raycast = $"."
@onready var item = $".."

func _physics_process(_delta: float) -> void:
	if raycast.is_colliding():
		item.queue_free()
		Global.item_check = false
