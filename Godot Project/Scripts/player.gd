class_name Player
extends CharacterBody2D

@export var points : Array[Marker2D] = []

@export var shield : PackedScene = preload("res://Scenes/ability_shield.tscn")
@export var sword : PackedScene = preload("res://Scenes/ability_sword.tscn")
@export var healthUI : Node2D

@export var pause : PackedScene

@onready var animations = $Sprite/AnimationPlayer

#Positions as follows:
#	0	1
#	2	3
var current_position = 0
var move_to
var move_speed = 175
var alive = true
var is_moving = false
var is_blinking = false
var can_shield = true
var can_sword = true
var up_down_locked = false
var left_right_locked = false

var health = 5

func _ready():
	global_position = points[current_position].global_position
	move_to = current_position
	self.add_to_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		var popUp = pause.instantiate()
		add_child(popUp)
		get_tree().paused = true
		
	if Input.is_action_just_pressed("shield") and can_shield and alive:
		can_sword = false
		var shield_active = shield.instantiate()
		shield_active.setRotation(Vector2(get_local_mouse_position().x, get_local_mouse_position().y).angle())
		add_child(shield_active)
		
	if Input.is_action_just_released("shield"):
		can_sword = true
		
	if Input.is_action_just_pressed("sword") and can_sword and alive:
		can_shield = false
		var sword_active = sword.instantiate()
		sword_active.setRotation(Vector2(get_local_mouse_position().x, get_local_mouse_position().y).angle())
		add_child(sword_active)
		
	if Input.is_action_just_released("sword"):
		can_shield = true
	
	#if Input.is_action_just_pressed("mouse_right") and can_shield:
		#can_shield = false
		#$ShieldTimer.start()
		#var shield_active = shield.instantiate()
		#add_child(shield_active)
	
	if is_moving and alive:
		animations.play("run")
	elif !is_moving and alive:
		animations.play("idle")
	
	if alive:
		movement_input()
		global_position = global_position.move_toward(points[move_to].global_position, delta*move_speed)
	else: global_position = global_position
	
	if global_position == points[0].global_position or global_position == points[1].global_position or global_position == points[2].global_position or global_position == points[3].global_position:
		current_position = move_to
		is_moving = false
		up_down_locked = false
		left_right_locked = false
		
		if current_position == 0 or current_position == 2:
			$Sprite.flip_h = false
		elif current_position == 1 or current_position == 3:
			$Sprite.flip_h = true

func damaged() ->void:
	health -= 1
	healthUI.updateUI(health)
	Sfx.play_hurt()
	if health == 0:
		$death.start()
		alive = false
		animations.play("death")
		
	if alive:
		is_blinking = true
		$Blink_All.start()
		$In_Out_Blink.start()
	
	

func movement_input():
	if Input.is_action_pressed("down"):
		if !is_moving:
			left_right_locked = true
			if current_position == 0:
				move_to = 2
				is_moving = true
			if current_position == 1:
				move_to = 3
				is_moving = true
		
		if is_moving and !up_down_locked:
			if move_to == 0:
				move_to = 2
			if move_to == 1:
				move_to = 3
	
	if Input.is_action_pressed("up"):
		if !is_moving:
			left_right_locked = true
			if current_position == 2:
				move_to = 0
				is_moving = true
			if current_position == 3:
				move_to = 1
				is_moving = true
		
		if is_moving and !up_down_locked:
			if move_to == 2:
				move_to = 0
			if move_to == 3:
				move_to = 1
	
	if Input.is_action_pressed("left"):
		if !is_moving:
			up_down_locked = true
			if current_position == 1:
				move_to = 0
				is_moving = true
			if current_position == 3:
				move_to = 2
				is_moving = true
		
		if is_moving and !left_right_locked:
			$Sprite.flip_h = true
			if move_to == 1:
				move_to = 0
			if move_to == 3:
				move_to = 2
	
	if Input.is_action_pressed("right"):
		if !is_moving:
			up_down_locked = true
			if current_position == 0:
				move_to = 1
				is_moving = true
			if current_position == 2:
				move_to = 3
				is_moving = true
		
		if is_moving and !left_right_locked:
			$Sprite.flip_h = false
			if move_to == 0:
				move_to = 1
			if move_to == 2:
				move_to = 3
	


#func _on_shield_timer_timeout():
	#can_shield = true


func _on_blink_all_timeout() -> void:
	is_blinking = false
	$Sprite.visible = true
	$In_Out_Blink.stop()


func _on_in_out_blink_timeout() -> void:
	if is_blinking:
		if $Sprite.visible: $Sprite.visible = false
		else: $Sprite.visible = true
	else: $In_Out_Blink.stop()


func _on_death_timeout() -> void:
	GameTrackingGlobal.fight_outcome = "Defeat"
	get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")
