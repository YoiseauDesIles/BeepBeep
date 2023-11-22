extends AudioStreamPlayer2D

var audioSound

# Called when the node enters the scene tree for the first time.
func _ready():
	stream = audioSound


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func victory():
	audioSound = preload("res://Assets/Audio/victory.mp3")
	stream = audioSound
	play()
	await get_tree().create_timer(2.0).timeout 
	audioSound = preload("res://Assets/Audio/victory2.mp3")
	stream = audioSound
	play()
	
func failure():
	audioSound = preload("res://Assets/Audio/failure.mp3")
	stream = audioSound
	play()
