extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Shield.add_to_group("Player_shield")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Shield.rotation = Vector2(get_local_mouse_position().x, get_local_mouse_position().y).angle()
	
	if Input.is_action_just_released("shield"):
		self.queue_free()
	
func setRotation(rot):
	$Shield.rotation = rot
