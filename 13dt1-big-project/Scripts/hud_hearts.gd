extends Control

@export var single_heart: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0,Global.lives):
		add_life()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_life():
	Global.lives += 1
	var hearts = single_heart.instantiate()
	$HBoxContainer.add_child(hearts)

func remove_life():
		Global.lives -= 1
		var hearts = $HBoxContainer.get_children()
		var health = len(hearts)
		$HBoxContainer.get_child(health - 1).queue_free()
