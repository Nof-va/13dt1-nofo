extends Area3D

var checkpoint_manager
var player
var game_over = preload("res://Scenes/main_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.lives = 3
	player = get_parent().get_node("Player")
	checkpoint_manager = get_parent().get_node("CheckpointManager")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") and Global.lives > 0:
		kill_player()
	if body.is_in_group("Player") and Global.lives == 0:
		get_tree().change_scene_to_packed.bind(game_over).call_deferred()
		
		#Original version of changing to different scene caused the error of 
		#get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
	print(Global.lives)

func kill_player():
	Global.lives -= 1
	player.position = checkpoint_manager.spawn_point
	
