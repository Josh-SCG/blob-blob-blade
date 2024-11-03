extends State

@export var shoot_state: State
@export var burst_state: State

var stall_start = false

func enter() -> void:
	pass

func process_physics(_delta: float) -> State:
	if stall_start:
		if parent.health > 50:
			return shoot_state
		elif parent.health > 35:
			var num = randi_range(0,2)
			if num == 0:
				return burst_state
			else:
				return shoot_state
		else:
			var num = randi_range(0,2)
			if num == 0:
				return shoot_state
			else:
				return burst_state
	return null
	

func _on_stall_start_timeout() -> void:
	stall_start = true
	
