extends Area3D

@export var item: PackedScene
@export var button_animator: AnimationPlayer
@export var spawn_location: Marker3D
var player
var player_check = false
var item_check = false


func _ready() -> void:
	player = get_parent().get_node("Player")


func _process(_delta: float) -> void:
	
	var this_item = item.instantiate()
	
	if Input.is_action_just_pressed("interact") and player_check == true:
		if item_check == false:
			button_animator.play("button_pressed")
			get_parent().add_child(this_item)
			this_item.position = spawn_location.global_position
			item_check = true
		else:
			button_animator.play("button_pressed")
			get_tree().get_first_node_in_group("Moveable").position = spawn_location.global_position
		

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = true


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = false
