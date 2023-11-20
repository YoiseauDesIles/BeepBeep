extends Node2D

var symbol1 = load("res://Assets/Images/1.png")
var symbol2 = load("res://Assets/Images/2.png")
var symbol3 = load("res://Assets/Images/3.png")
var symbol4 = load("res://Assets/Images/4.png")
var symbol5 = load("res://Assets/Images/5.png")
var symbol6 = load("res://Assets/Images/6.png")
var symbol7 = load("res://Assets/Images/7.png")
var symbol8 = load("res://Assets/Images/8.png")
var symbol9 = load("res://Assets/Images/9.png")

@onready var code1 = $Background/symbol1
@onready var code2 = $Background/symbol2
@onready var code3 = $Background/symbol3
@onready var code4 = $Background/symbol4
@onready var code5 = $Background/symbol5
@onready var code6 = $Background/symbol6
@onready var code7 = $Background/symbol7
@onready var code8 = $Background/symbol8
@onready var code9 = $Background/symbol9

@onready var btn1 = $Background/bnt1/btnBG
@onready var btn2 = $Background/btn2/btnBG
@onready var btn3 = $Background/btn3/btnBG
@onready var btn4 = $Background/btn4/btnBG
@onready var btn5 = $Background/btn5/btnBG
@onready var btn6 = $Background/btn6/btnBG
@onready var btn7 = $Background/btn7/btnBG
@onready var btn8 = $Background/btn8/btnBG
@onready var btn9 = $Background/btn9/btnBG

@onready var pushedBtn = $Background/pushBtn/Sprite2D

@onready var clickedBtnTexture = load ("res://Assets/Images/symbolBtnPushed.png")
@onready var pushedBtnTexture = load ("res://Assets/Images/pushedBtn.png")

var symbolDict = {
	1 : symbol1,
	2 : symbol2,
	3 : symbol3,
	4 : symbol4,
	5 : symbol5,
	6 : symbol6,
	7 : symbol7,
	8 : symbol8,
	9 : symbol9,
}
var combination : Array = []
var currCombination : Array = []
var combinationDone = false
var eventProcessed = false

var codeState = "standby"

# Called when the node enters the scene tree for the first time.
func _ready():
		
	var symbols = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	for i in range(0, 4):
		var currRand = randi() % symbols.size()
		var currSymb = symbols[currRand]
		symbols.remove_at(currRand)
		combination.append(currSymb)
	
	code1.texture = symbolDict.get(combination[0] )
	code2.texture = symbolDict.get(combination[1] )
	code3.texture = symbolDict.get(combination[2] )
	code4.texture = symbolDict.get(combination[3] )
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

			

func _on_bnt_1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			btn1.texture = clickedBtnTexture
			currCombination.append(1)
			
		else:
			eventProcessed = false


func _on_btn_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			btn2.texture = clickedBtnTexture
			currCombination.append(2)
			
		else:
			eventProcessed = false


func _on_btn_3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			btn3.texture = clickedBtnTexture
			currCombination.append(3)
			
		else:
			eventProcessed = false

func _on_btn_4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			btn4.texture = clickedBtnTexture
			currCombination.append(4)
			
		else:
			eventProcessed = false


func _on_btn_5_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			btn5.texture = clickedBtnTexture
			currCombination.append(5)
			
		else:
			eventProcessed = false


func _on_btn_6_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			btn6.texture = clickedBtnTexture
			currCombination.append(6)
			
		else:
			eventProcessed = false


func _on_btn_7_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			btn7.texture = clickedBtnTexture
			currCombination.append(7)
			
		else:
			eventProcessed = false


func _on_btn_8_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			btn8.texture = clickedBtnTexture
			currCombination.append(8)
			
		else:
			eventProcessed = false


func _on_btn_9_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			btn9.texture = clickedBtnTexture
			currCombination.append(9)
			
		else:
			eventProcessed = false

func _on_push_btn_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		checkCombination()
			
		
func checkCombination():
	
	if currCombination.size() == 4:
		pushedBtn.texture = pushedBtnTexture
		if currCombination == combination:
			codeState = "success"
		else:
			codeState = "failure"

func getState():
	return codeState



