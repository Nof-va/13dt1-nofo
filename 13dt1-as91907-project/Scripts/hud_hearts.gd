extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Countlives.lives=3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Countlives.lives == 2:
		$ColorRect3.hide()
	if Countlives.lives == 1:
		$ColorRect2.hide()
	if Countlives.lives == 0:
		get_tree().reload_current_scene()
