extends Camera2D

var ssCount = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dir = DirAccess.open("user://")
	dir.make_dir("screenshot")
	
	dir = DirAccess.open("user://screenshot/")
	for n in dir.get_files():
		ssCount +=1

func screenshot():
	await RenderingServer.frame_post_draw
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()
	img.save_png("user://screenshot/Screenshot"+str(ssCount)+".png")
	ssCount += 1

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("test"):
		print("shot")
		screenshot()
