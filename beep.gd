extends AudioStreamPlayer2D

var audioSound = preload("res://Assets/Audio/beep.mp3")
var BPM = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	stream = audioSound

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func beep():
	play()

func beepFailure():
	audioSound = preload("res://Assets/Audio/beepFailure.mp3")
	stream = audioSound
	play()
	await get_tree().create_timer(1.5).timeout 
	stop()
