extends Control

@export var single_heart: PackedScene
@export var hearts_container: HBoxContainer


func _ready():
	reset_lives()


func reset_lives():
	for i in range(0,3):
		add_life()


func add_life():
	var hearts = single_heart.instantiate()
	hearts_container.add_child(hearts)


func remove_life():
		Global.lives -= 1
		var hearts = hearts_container.get_children()
		var health = len(hearts)
		hearts_container.get_child(health - 1).queue_free()
