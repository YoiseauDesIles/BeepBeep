extends AudioStreamPlayer2D

var audioSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pressKey():
	audioSound = preload("res://Assets/Audio/keyPressed.mp3")
	stream = audioSound
	play()

func pushButton():
	audioSound = preload("res://Assets/Audio/pushButton.mp3")
	stream = audioSound
	play()
