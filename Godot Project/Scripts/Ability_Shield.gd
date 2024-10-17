extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$RotatePoint.rotation += delta * 12
	$RotatePoint.rotation = Vector2(get_local_mouse_position().x, get_local_mouse_position().y).angle()
	
	if Input.is_action_just_released("shield"):
		self.queue_free()

#Timer is a relic of the old implementation
func _on_timer_timeout():
	self.queue_free()



func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy Projectile"):
		body.queue_free()
