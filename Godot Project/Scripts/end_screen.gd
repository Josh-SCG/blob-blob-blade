extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Music.play_menu_song()
	if GameTrackingGlobal.fight_outcome == "Win":
		$Top_Title.text = "You are VICTORIOUS!"
		$Lose_Screen.visible = false
		$Win_Screen.visible = true
	elif GameTrackingGlobal.fight_outcome == "Defeat":
		$Top_Title.text = "You are DEFEATED!"
		$Lose_Screen.visible = true
		$Win_Screen.visible = false
	else: $Top_Title.text = "You SHOULD NOT SEE THIS TEXT!?!?!"

func _on_menu_pressed() -> void:
	GameTrackingGlobal.fight_outcome = " "
	GameTrackingGlobal.achieve_root_check = true
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
