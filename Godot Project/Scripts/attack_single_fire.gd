extends State

@export var think_state: State
@export var bullet : PackedScene = preload("res://Scenes/enemy_homing_attack.tscn")

var move_on = false

func enter() -> void:
	if parent.health < 50:
		$wait.wait_time = 0.66
	move_on = false
	var bullet_in_action = bullet.instantiate()
	bullet_in_action.start(parent.player, parent.myself, parent.position + Vector2(0,0))
	get_parent().add_child(bullet_in_action)

func process_physics(_delta: float) -> State:
	if move_on:
		return think_state
	return null


func _on_wait_timeout() -> void:
	move_on = true
