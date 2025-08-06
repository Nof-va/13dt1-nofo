extends Area3D

var player
var player_check = false
var item = preload("res://Scenes/box_item.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_node("Player")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	var this_item = item.instantiate()
	
	if Input.is_action_just_pressed("interact") and player_check == true and Global.item_check == false:
		$AnimationPlayer.play("button_pressed")
		get_parent().add_child(this_item)
		this_item.position = $SpawnItem.global_position
		Global.item_check = true


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = true


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_check = false
