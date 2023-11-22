extends AudioStreamPlayer

var audioSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func gameSelection():
	audioSound = preload("res://Assets/Audio/gameSelection.mp3")
	stream = audioSound
	play()
