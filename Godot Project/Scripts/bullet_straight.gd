extends CharacterBody2D

var speed = 25
var acceleration = 50
var dir = 1

func start(_position, _rotation, parentPos) -> void:
	self.z_index = 2
	position = parentPos + _position + Vector2(0,-5)
	rotation_degrees = _rotation

func _process(delta: float) -> void:
	position += transform.x * delta * speed * dir

func _on_slow_start_timeout() -> void:
	position -= transform.x * 60
	self.z_index = 0
	speed = 200

func _on_queue_free_timeout() -> void:
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.damaged()
		queue_free()
	elif body.is_in_group("Enemy") and dir == -1:
		body.damaged()
		queue_free()
	elif body.is_in_group("Player_weapon"):
		Sfx.play_deflect()
		GameTrackingGlobal.achieve_deflect_counter += 1
		if GameTrackingGlobal.achieve_deflect_counter >= 40:
			GameTrackingGlobal.achieve_deflect= 1
		body.get_parent().sword_reset()
		dir = -1
	elif body.is_in_group("Player_shield"):
		Sfx.play_block()
		queue_free()
