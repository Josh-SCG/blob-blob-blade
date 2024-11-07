extends Node2D

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_kenny_link_pressed() -> void:
	OS.shell_open("https://kenney.nl/assets/1-bit-input-prompts-pixel-16")


func _on_me_link_pressed() -> void:
	OS.shell_open("https://josh-scg.itch.io")
