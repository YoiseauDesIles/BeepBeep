extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func gameSuccess():
	texture = load ("res://Assets/Images/success.png")


func gameOver():
	texture = load ("res://Assets/Images/failure.png")
