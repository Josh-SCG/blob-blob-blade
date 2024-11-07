extends Area2D

var target = null
var speed = 10
var size = 0.05
# Called when the node enters the scene tree for the first time.
func start(_position) -> void:
	speed = 10
	position = _position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += delta * speed
	scale -= Vector2(delta, delta) * size


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		target = body


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		target = null


func _on_damage_timeout() -> void:
	if target:
		target.damaged()
	queue_free()


func _on_speed_timeout() -> void:
	speed = 30
	$collapse.start()


func _on_collapse_timeout() -> void:
	size = 0.8
	$damage.start()
