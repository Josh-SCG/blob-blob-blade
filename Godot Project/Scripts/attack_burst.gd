extends State

@export var think_state: State
@export var bullet : PackedScene = preload("res://Scenes/enemy_burst_bullet.tscn")

var move_on = false
var bullet_amount = 0

func enter() -> void:
	move_on = false
	if parent.health > 35 and parent.health <= 50: 
		bullet_amount = 24
	elif parent.health > 15 and parent.health <= 35: 
		$wait.wait_time = 2
		bullet_amount = 36
	elif parent.health < 15: 
		$wait.wait_time = 1.5
		bullet_amount = 48
	burst()

func process_physics(_delta: float) -> State:
	if move_on:
		return think_state
	return null


func _on_wait_timeout() -> void:
	move_on = true

func burst():	
	var theta = 0.0
	for i in bullet_amount:
		var bullet_in_action = bullet.instantiate()
		bullet_in_action.start(Vector2(cos(deg_to_rad(theta)), sin(deg_to_rad(theta))), theta, parent.position)
		get_parent().add_child(bullet_in_action)
		theta += 360/float(bullet_amount)
