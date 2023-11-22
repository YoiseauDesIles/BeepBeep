extends AudioStreamPlayer2D

var audioSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func openingBox():
	audioSound = preload("res://Assets/Audio/boxOpening.mp3")
	stream = audioSound
	play()
	
func boxOpened():
	audioSound = preload("res://Assets/Audio/boxOpened.mp3")
	stream = audioSound
	play()

func cutWires():
	audioSound = preload("res://Assets/Audio/cutWires.mp3")
	stream = audioSound
	play()
