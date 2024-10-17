extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$RotatePoint.rotation = Vector2(get_local_mouse_position().x, get_local_mouse_position().y).angle()
	
	if Input.is_action_just_released("sword"):
		self.queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy Projectile"):
		body.return_to_sender()
