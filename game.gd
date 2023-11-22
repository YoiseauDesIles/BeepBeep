extends Node2D

var endOfGameScene
var codeGameScene
var pushedBtnGameScene
var cutWireScene
var briefCaseState
var mainMenuScene
var beepSound
var briefCaseSound 
var menuSound

var briefCaseStatus : Array = [false, false, false]
var beepTimer = 1
var beepCnt = 0
var bombExplosionThreshold = 2000
var gameIsOver = false
# Called when the node enters the scene tree for the first time.
func _ready():
	beepSound = get_node("/root/MainScene/Audio/beep")
	menuSound = get_node("/root/MainScene/Audio/menu")
	briefCaseSound = get_node("/root/MainScene/Audio/briefcase")
	codeGameScene = get_node("/root/MainScene/CodeScene")
	pushedBtnGameScene = get_node("/root/MainScene/PushBtnScene")
	cutWireScene = get_node("/root/MainScene/CutWireScene")
	#briefCaseState = get_node("/root/MainScene/EndOfGameScene/Briefcase")
	mainMenuScene = get_node("/root/MainScene/MenuScene")
	endOfGameScene = get_node("/root/MainScene/EndOfGameScene")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not gameIsOver:
		handleBeep()
		handleGameStatus()
		if briefCaseStatus == [true, true, true]:
			gameIsOver = true
			win()

func handleBeep():
	if beepCnt >= ((15000 / beepTimer)):
		beepSound.beep()
		beepCnt = 0
	beepCnt += 1
	beepTimer +=1
	
	if beepTimer >= bombExplosionThreshold:
		gameOver()

func handleGameStatus():
	handleCodeGame()
	handlePushBtnGame()
	handleCutWireGame()

func handleCodeGame():
	if codeGameScene.getState() == "success":
		briefCaseStatus[0] = true
	elif codeGameScene.getState() == "failure":
		gameOver()

func handlePushBtnGame():
	if pushedBtnGameScene.getGameStatus() == "success":
		briefCaseStatus[1] = true
	elif pushedBtnGameScene.getGameStatus() == "failure":
		gameOver()
		
func handleCutWireGame():
	if (cutWireScene.getWireStatus() == "CUT"):
		briefCaseStatus[2] = true

func win():
	endOfGameScene.gameSuccess()
	hideElements()
	endOfGameScene.visible = true
	briefCaseSound.victory()
	endOfGameScene.setRestart()
	
	
func gameOver():
	gameIsOver = true
	beepSound.beepFailure()
	await get_tree().create_timer(2.0).timeout 
	endOfGameScene.gameOver()
	hideElements()
	endOfGameScene.visible = true
	briefCaseSound.failure()
	endOfGameScene.setRestart()
	
		
func hideElements():
	mainMenuScene.visible = false
	codeGameScene.visible = false
	cutWireScene.visible = false
	pushedBtnGameScene.visible = false
	
func restart():
	get_tree().reload_current_scene()
	
func changeCursorHand():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

	
func changeCursorBack():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_write_the_code_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		menuSound.gameSelection()
		mainMenuScene.visible = false
		codeGameScene.visible = true

func _on_push_the_button_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		menuSound.gameSelection()
		mainMenuScene.visible = false
		pushedBtnGameScene.visible = true


func _on_cut_wire_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		menuSound.gameSelection()
		mainMenuScene.visible = false
		cutWireScene.visible = true

func _on_back_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		menuSound.gameSelection()
		mainMenuScene.visible = true
		codeGameScene.visible = false
		cutWireScene.visible = false
		pushedBtnGameScene.visible = false


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and gameIsOver:
		restart()
