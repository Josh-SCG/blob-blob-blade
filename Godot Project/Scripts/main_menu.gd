extends Node2D

func _on_btn_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/fight.tscn")


func _on_btn_achieve_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/achievements.tscn")


func _on_btn_how_to_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/how_to.tscn")


func _on_btn_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")


func _on_btn_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
