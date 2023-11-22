extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func gameSuccess():
	$Briefcase.texture = load ("res://Assets/Images/success.png")


func gameOver():
	$Briefcase.texture = load ("res://Assets/Images/failure.png")

func setRestart():
	$restartBtn/Area2D.visible = true
	$restartBtn/Area2D/CollisionShape2D.disabled = false

func gameRestart():
	$restartBtn/Area2D.visible = false
	$restartBtn/Area2D/CollisionShape2D.disabled = true
