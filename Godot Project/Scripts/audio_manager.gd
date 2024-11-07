extends AudioStreamPlayer

func play_menu_song():
	self.stream = preload("res://Assets/Audio/on_a_whim.ogg")
	self.play()
	
func play_fight_song():
	self.stream = preload("res://Assets/Audio/sparking.ogg")
	self.play()
