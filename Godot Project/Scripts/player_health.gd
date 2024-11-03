extends Node2D

@onready var heart1 = $Heart1
@onready var heart2 = $Heart2
@onready var heart3 = $Heart3
@onready var heart4 = $Heart4
@onready var heart5 = $Heart5

func updateUI(num: int) -> void:
	if num == 4:
		heart5.frame = 15
	elif num == 3:
		heart4.frame = 15
	elif num == 2:
		heart3.frame = 15
	elif num == 1:
		heart2.frame = 15
