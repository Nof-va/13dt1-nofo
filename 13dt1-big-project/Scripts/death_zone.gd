extends Area3D

var player
var game_over = preload("res://Scenes/main_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.lives = 3
	player = get_parent().get_node("Player")

# Kills
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") and Global.lives > 0:
		kill_player()
	if body.is_in_group("Player") and Global.lives == 0:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_packed.bind(game_over).call_deferred()
		Global.lives = 3
	if body.is_in_group("Moveable"):
		var item = get_parent().get_node("RigidBody3D")
		item.queue_free()
		Global.item_check = false
	

# Puts player to last checkpoint
func kill_player():
	player.position = Global.spawn_point
	player.something.remove_life()
	
