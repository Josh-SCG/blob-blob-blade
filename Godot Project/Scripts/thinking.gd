extends State

@export var shoot_state: State
@export var burst_state: State
@export var corner_state: State

var stall_start = false

func enter() -> void:
	pass

func picker(state1: State, state2: State) -> State:
	var num = randi_range(0,1)
	if num == 0: return state1
	else: return state2

func process_physics(_delta: float) -> State:
	if parent.health <= 0:
		return null
	if stall_start:
		if parent.health > 50:
			return picker(shoot_state, corner_state)
			
		elif parent.health > 35:
			var num = randi_range(0,2)
			if num == 0: return burst_state
			else: return picker(shoot_state, corner_state)
				
		else:
			var num = randi_range(0,2)
			if num == 0: return picker(shoot_state, corner_state)
			else: return burst_state
	
	return null
	

func _on_stall_start_timeout() -> void:
	Music.play_fight_song()
	stall_start = true
	
