extends Node2D

var endOfGameScene
var codeGameScene
var cutWireScene
var briefCaseState
var mainMenuScene
var briefCaseStatus : Array = [false, false, false]

@onready var codeLightStatus = $CodeGameLight
@onready var buttonGameLight = $ButtonGameLight
@onready var wiresGameLight = $WiresGameLight

# Called when the node enters the scene tree for the first time.
func _ready():
	codeGameScene = get_node("/root/MainScene/CodeScene")
	cutWireScene = get_node("/root/MainScene/CutWireScene")
	briefCaseState = get_node("/root/MainScene/EndOfGameScene/Briefcase")
	mainMenuScene = get_node("/root/MainScene/MenuScene")
	endOfGameScene = get_node("/root/MainScene/EndOfGameScene")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handleGameStatus()
	
	if briefCaseStatus == [true, false, true]:
		win()


func handleGameStatus():
	handleCodeGame()
	handleCutWireGame()

func handleCodeGame():
	if codeGameScene.getState() == "success":
		briefCaseStatus[0] = true
	elif codeGameScene.getState() == "failure":
		gameOver()

func handleCutWireGame():
	if (cutWireScene.getWireStatus() == "CUT"):
		briefCaseStatus[2] = true

func win():
	briefCaseState.gameSuccess()
	hideElements()
	endOfGameScene.visible = true
	
	
func gameOver():
	briefCaseState.gameOver()
	hideElements()
	endOfGameScene.visible = true
		
func hideElements():
	mainMenuScene.visible = false
	codeGameScene.visible = false
	cutWireScene.visible = false
	

	
func changeCursorHand():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

	
func changeCursorBack():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_write_the_code_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		mainMenuScene.visible = false
		codeGameScene.visible = true

func _on_cut_wire_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		mainMenuScene.visible = false
		cutWireScene.visible = true

func _on_back_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		mainMenuScene.visible = true
		codeGameScene.visible = false
		cutWireScene.visible = false


