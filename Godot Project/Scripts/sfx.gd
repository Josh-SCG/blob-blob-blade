extends AudioStreamPlayer

@export var hurt: AudioStream
@export var block: AudioStream
@export var deflect: AudioStream

func sfxAudio(sound: AudioStream):
	var instance = AudioStreamPlayer.new()
	instance.stream = sound
	instance.bus = "sfx"
	instance.finished.connect(remove_node.bind(instance))
	add_child(instance)
	instance.play()

func remove_node(instance: AudioStreamPlayer):
	instance.queue_free()

func play_hurt():
	sfxAudio(hurt)

func play_block():
	sfxAudio(block)

func play_deflect():
	sfxAudio(deflect)
