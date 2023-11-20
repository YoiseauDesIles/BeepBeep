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
var incrSpeed = 0
var thresholds : Array = [100, 200, 300, 350]
var eventProcessed = false
var btnPushed = false

var pushedGameStatus = "STANDBY"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateLights() 

func updateLights():
	print(currGauge)
	if currGauge >= thresholds[0]:
		light1.texture = load("res://Assets/Images/ampoules/11.png")
	if currGauge >= thresholds[1]:
		light2.texture = load("res://Assets/Images/ampoules/22.png")
	if currGauge >= thresholds[2]:
		light3.texture = load("res://Assets/Images/ampoules/33.png")
		if (btnPushed == false):
			pushedGameStatus = "success"
	if currGauge >= thresholds[3]:
		light4.texture = load("res://Assets/Images/ampoules/33.png")
		pushedGameStatus = "failure"


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			button.texture = pushedBtnTexture
			
			currGauge += gaugeIncrValue
			btnPushed = true
		
		else:
			button.texture = btnTexture
			btnPushed = false
