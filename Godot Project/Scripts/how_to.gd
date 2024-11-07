extends Node2D

var current_page = 1
@onready var title = $Box/Box_Name
@onready var contents = $Box/Box_Contents
@onready var page = $Box/Box_Page_Num


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Next.visible = true
	$Prev.visible = false
	title.text = "What is the goal?"
	contents.text = "Defeat the Sprite. You must deflect incoming projectiles to deal damage to them while avoinding attacks on the corners."
	page.text = "1/6"
	
	$Sprite.visible = true
	$Movement.visible = false
	$SWSH.visible = false
	$Deflect.visible = false
	$Enemy.visible = false
	$Pause.visible = false



func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func change_content() -> void:
	if current_page == 1:
		title.text = "What is the goal?"
		contents.text = "Defeat the Sprite. You must deflect incoming projectiles to deal damage to them while avoinding attacks on the corners."
		page.text = "1/6"
		$Sprite.visible = true
		$Movement.visible = false
	elif current_page == 2:
		title.text = "Movement"
		contents.text = "Using the shown keys, you can move between the four corners of the field. Use it to reposition out of the way of some attacks."
		page.text = "2/6"
		$Sprite.visible = false
		$Movement.visible = true
		$SWSH.visible = false
	elif current_page == 3:
		title.text = "Sword and Shield"
		contents.text = "Holding down a mouse button will summon either the sword for deflection or shield for blocking. Once in use they will follow the cursor. They cannot be used at the same time however."
		page.text = "3/6"
		$Movement.visible = false
		$SWSH.visible = true
		$Deflect.visible = false
	elif current_page == 4:
		title.text = "Deflecting"
		contents.text = "Hitting one of the Sprite's projectiles with the sword will send them back at them. This is your only way to deal damage to them. You can do this three (3) times before needing to summon again."
		page.text = "4/6"
		$SWSH.visible = false
		$Deflect.visible = true
		$Enemy.visible = false
	elif current_page == 5:
		title.text = "Enemy Attacks"
		contents.text = "The sprite has three (3) attacks to watch out for. If you see a spinning circle on a corner, it's best to move to a new one. All incoming projectiles can be blocked or deflected."
		page.text = "5/6"
		$Deflect.visible = false
		$Enemy.visible = true
		$Pause.visible = false
	elif current_page == 6:
		title.text = "Pausing"
		contents.text = "Pause with the designated button to take a breather or return to the menu."
		page.text = "6/6"
		$Enemy.visible = false
		$Pause.visible = true
	

func _on_prev_pressed() -> void:
	if current_page != 1:
		current_page -= 1
		change_content()
		$Next.visible = true
		if current_page == 1:
			$Prev.visible = false


func _on_next_pressed() -> void:
	if current_page != 6:
		current_page += 1
		change_content()
		$Prev.visible = true
		if current_page == 6:
			$Next.visible = false
	
