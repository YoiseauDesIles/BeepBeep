extends Node2D

var codeGame
@onready var briefCase
@onready var gameBG


# Called when the node enters the scene tree for the first time.
func _ready():
	codeGame = get_node("/root/MainScene/GameScene/CodeScene")
	briefCase = get_node("/root/MainScene/GameScene/Briefcase")
	gameBG = get_node("/root/MainScene/GameScene/Background")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handleCodeGame()

func handleCodeGame():
	if codeGame.getState() == "success":
		briefCase.gameSuccess()
		gameBG.endOfGame()
	elif codeGame.getState() == "failure":
		briefCase.gameOver()
		gameBG.endOfGame()

func changeCursorHand():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

	
func changeCursorBack():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_write_the_code_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		$Background.visible = false
		$writeTheCode.visible = false
		$pushTheButton.visible = false
		$cutTheStrings.visible = false
		$CodeScene.visible = true
		$BackBtn.visible = true


func _on_back_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		$Background.visible = true
		$CodeScene.visible = false
		$BackBtn.visible = false
		$writeTheCode.visible = true
		$pushTheButton.visible = true
		$cutTheStrings.visible = true
