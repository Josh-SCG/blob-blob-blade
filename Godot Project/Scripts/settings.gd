extends Node2D

var master_bus = AudioServer.get_bus_index("Master")
var sfx_bus = AudioServer.get_bus_index("sfx")
var music_bus = AudioServer.get_bus_index("music")

func _ready() -> void:
	$music.value = AudioServer.get_bus_volume_db(music_bus)
	$sfx.value = AudioServer.get_bus_volume_db(sfx_bus)

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_test_sfx_pressed() -> void:
	Sfx.play_deflect()

func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(sfx_bus, true)
	else:
		AudioServer.set_bus_mute(sfx_bus, false)

func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(music_bus, true)
	else:
		AudioServer.set_bus_mute(music_bus, false)
