extends CharacterBody2D


var speed = 125
var turn_force = 200

var acceleration = Vector2.ZERO

var target = null
var target2 = null
var target_name = "Player"

func start(_target, _target2, _position):
	self.z_index = 2
	position = _position
	rotation += randf_range(-0.09, 0.09)
	velocity = transform.y * speed * -1
	target = _target
	target2 = _target2

func seek():
	var steer = Vector2.ZERO
	if target:
		var desired = (target.position - position).normalized() * speed
		steer = (desired - velocity).normalized() * turn_force
	return steer
	

func _physics_process(delta):
	acceleration += seek()
	velocity += acceleration * delta
	velocity = velocity.limit_length(speed)
	rotation = velocity.angle()
	position += velocity * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and target_name == "Player":
		body.damaged()
		queue_free()
	elif body.is_in_group("Enemy") and target_name == "Enemy":
		body.damaged()
		queue_free()
	elif body.is_in_group("Player_weapon") and target_name == "Player":
		Sfx.play_deflect()
		GameTrackingGlobal.achieve_deflect_counter += 1
		if GameTrackingGlobal.achieve_deflect_counter >= 40:
			GameTrackingGlobal.achieve_deflect= 1
		body.get_parent().sword_reset()
		target = target2
		target_name = "Enemy"
		acceleration = Vector2.ZERO
		velocity = Vector2.ZERO
	elif body.is_in_group("Player_shield"):
		Sfx.play_block()
		queue_free()
