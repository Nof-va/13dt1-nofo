extends Area3D

@export var item : PackedScene
var player
var player_check = false


func _ready() -> void:
	player = get_parent().get_node("Player")


func _process(_delta: float) -> void:
	
	var this_item = item.instantiate()
	
	if this_item != null and is_instance_valid(this_item) and this_item.is_inside_tree():
		Global.item_check = true
		print("I am here")
	else:
		Global.item_check = false
		print("I am not here")
	
	if Input.is_action_just_pressed("interact") and player_check == true and Global.item_check == false:
		$AnimationPlayer.play("button_pressed")
		get_parent().add_child(this_item)
		this_item.position = $SpawnItem.global_position


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = true


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = false
