extends Node2D

@onready var light1 = $Light1
@onready var light2 = $Light2
@onready var light3 = $Light3
@onready var light4 = $Light4
@onready var button = $Button

var btnTexture = load("res://Assets/Images/pushBtn.png")
var pushedBtnTexture = load("res://Assets/Images/pushedBtn.png")

var currGauge = 0
var gaugeIncrValue = 5
var timerCnt = 0
var timerThreshold = 50
var thresholds : Array = [1000, 2000, 3000, 3300]
var lightStatus: Array = [false, false, false, false]
var eventProcessed = false
var btnPushed = false

var pushedGameStatus = "STANDBY"

@onready var pushBtnSound = get_node("/root/MainScene/Audio/pushBtn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	riseGauge()
	updateLights() 
	handleLightStatus()

func riseGauge():
	if btnPushed:
		if timerCnt > timerThreshold:
			gaugeIncrValue = randi() % 20 
			timerCnt = 0
		currGauge += gaugeIncrValue
		timerCnt += 1
		
func updateLights():
	if currGauge >= thresholds[0] and lightStatus[0] == false:
		pushBtnSound.light()
		light1.texture = load("res://Assets/Images/ampoules/11.png")
		lightStatus[0] = true
	if currGauge >= thresholds[1] and lightStatus[1] == false:
		pushBtnSound.light()
		light2.texture = load("res://Assets/Images/ampoules/22.png")
		lightStatus[1] = true
	if currGauge >= thresholds[2] and lightStatus[2] == false:
		pushBtnSound.light()
		light3.texture = load("res://Assets/Images/ampoules/33.png")
		lightStatus[2] = true
	if currGauge >= thresholds[3] and lightStatus[3] == false:
		pushBtnSound.light()
		light4.texture = load("res://Assets/Images/ampoules/44.png")
		lightStatus[3] = true
	
func handleLightStatus():
		if (btnPushed == false and lightStatus[2] == true and lightStatus[3] == false):
			pushedGameStatus = "success"
		elif (lightStatus[3] == true):
			pushedGameStatus = "failure"
			
func getGameStatus():
	return pushedGameStatus

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			pushBtnSound.pushButton()
			button.texture = pushedBtnTexture
			btnPushed = true
		
		else:
			button.texture = btnTexture
			btnPushed = false
			

