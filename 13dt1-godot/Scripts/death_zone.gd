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
	

# Puts player to last checkpoint and updates lives
func kill_player():
	player.position = Global.spawn_point
	player.hud_hearts.remove_life()
	
