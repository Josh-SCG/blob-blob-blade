extends Node2D

var hit_count
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_count = 0
	$Sword.add_to_group("Player_weapon")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Sword.rotation = Vector2(get_local_mouse_position().x, get_local_mouse_position().y).angle()
	
	if Input.is_action_just_released("sword"):
		self.queue_free()

func setRotation(rot):
	$Sword.rotation = rot

func sword_reset():
	var player = get_parent()
	if hit_count >= 2 :
		player.can_shield = true
		queue_free()
		hit_count = 0
	else:
		hit_count += 1
