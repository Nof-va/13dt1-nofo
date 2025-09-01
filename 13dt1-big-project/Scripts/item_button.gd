extends Area3D

@export var item : PackedScene
var player
var player_check = false
var item_check 

func _ready() -> void:
	player = get_parent().get_node("Player")


func _process(_delta: float) -> void:
	
	var this_item = item.instantiate()
	
	if this_item.is_inside_tree():
		item_check = true
	else:
		item_check = false
	
	if Input.is_action_just_pressed("interact") and player_check == true and item_check == false:
		$AnimationPlayer.play("button_pressed")
		get_parent().add_child(this_item)
		this_item.position = $SpawnItem.global_position


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = true


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = false
