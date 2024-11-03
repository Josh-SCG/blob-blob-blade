class_name State
extends Node

@export var animation_name: String
@export var move_speed: float = 200

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: CharacterBody2D 
var animations: AnimatedSprite2D

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
