extends CanvasLayer



func _on_play_button_pressed() -> void:
	get_tree().paused = false
	self.queue_free()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	GameTrackingGlobal.achieve_root_check = true
	Music.play_menu_song()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
