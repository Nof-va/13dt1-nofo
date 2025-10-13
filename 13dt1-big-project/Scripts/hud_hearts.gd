extends Control

@export var single_heart: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	reset_lives()


func reset_lives():
	for i in range(0,3):
		add_life()


func add_life():
	var hearts = single_heart.instantiate()
	$Hearts.add_child(hearts)


func remove_life():
		Global.lives -= 1
		var hearts = $Hearts.get_children()
		var health = len(hearts)
		$Hearts.get_child(health - 1).queue_free()
