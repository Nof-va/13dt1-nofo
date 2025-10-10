extends Area3D

@export var item : PackedScene
var player
var player_check = false
var item_check = false


func _ready() -> void:
	player = get_parent().get_node("Player")


func _process(_delta: float) -> void:
	
	var this_item = item.instantiate()
	
	if Input.is_action_just_pressed("interact") and player_check == true:
		if item_check == false:
			$AnimationPlayer.play("button_pressed")
			get_parent().add_child(this_item)
			this_item.position = $SpawnItem.global_position
			item_check = true
		else:
			$AnimationPlayer.play("button_pressed")
			get_tree().get_first_node_in_group("Moveable").position = $SpawnItem.global_position
		
	
	if item_check == false:
		print("not here")
	else:
		print("here")


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = true


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = false
