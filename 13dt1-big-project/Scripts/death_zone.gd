extends Area3D

var game_over = preload("res://Scenes/main_menu.tscn")
@onready var player = get_parent().get_node("Player")


func _ready() -> void:
	Global.lives = 3


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") and Global.lives > 0:
		player.visible = false
		await get_tree().create_timer(0.5).timeout
		kill_player()
	if body.is_in_group("Player") and Global.lives == 0:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_packed.bind(game_over).call_deferred()
		Global.lives = 3


# Puts player to last checkpoint
func kill_player():
	player.visible = true
	player.position = Global.spawn_point
	player.hearts.remove_life()
	
