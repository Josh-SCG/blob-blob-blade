extends CharacterBody2D

@export var player: Player
@export var myself: CharacterBody2D
@export var health_bar: ColorRect

@export var points : Array[Marker2D] = []
@export var move_speed = 10

@onready var sprite = $Sprite
@onready var health : int = 100
@onready var animations = $Sprite
@onready var state_machine = $"State Machine"


var move_to = 0

func _ready() -> void:
	global_position = points[move_to].global_position
	state_machine.init(self, animations)
	self.add_to_group("Enemy")
	if player.global_position.x < 120:
		sprite.flip_h = true
	


func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	health_bar.size.x = health
	
	if global_position == points[0].global_position and sprite.flip_h == true: move_to = 1
	elif global_position == points[0].global_position and sprite.flip_h == false: move_to = 2
	
	if global_position == points[1].global_position or global_position == points[2].global_position: move_to = 0
	
	global_position = global_position.move_toward(points[move_to].global_position, delta*move_speed)
	
	if player.global_position.x < 120:
		sprite.flip_h = true
	elif player.global_position.x > 120:
		sprite.flip_h = false
		
	if Input.is_action_just_pressed("down"):
		health -= 5

func damaged() ->void:
	health -= 5
