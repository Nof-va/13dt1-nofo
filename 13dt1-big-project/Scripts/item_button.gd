extends Area3D

var player
var check = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_node("Player")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and check == true:
		$AnimationPlayer.play("button_pressed")


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		check = true


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		check = false
