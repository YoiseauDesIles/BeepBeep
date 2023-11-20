extends Node2D

@export var boxOpeningDelay = 1
@onready var wire1 = $Box1/Wires
@onready var wire2 = $Box2/Wires
@onready var wire3 = $Box3/Wires
@onready var wire4 = $Box4/Wires

@onready var box1 = $Box1/BoxSprite
@onready var box2 = $Box2/BoxSprite
@onready var box3 = $Box3/BoxSprite
@onready var box4 = $Box4/BoxSprite
@onready var tex = load("res://Assets/Images/strings.png")

var boxesOpenState : Array = [false, false, false, false]
var wiresPosition
var eventProcessed = false
var boxReady = false
var wireStatus = "STANDBY"


# Called when the node enters the scene tree for the first time.
func _ready():

	wiresPosition = randi() % 4
	wire1.texture = tex if wiresPosition == 0 else null
	wire2.texture = tex if wiresPosition == 1 else null
	wire3.texture = tex if wiresPosition == 2 else null
	wire4.texture = tex if wiresPosition == 3 else null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func getWireStatus():
	return wireStatus
	
func _on_box_1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			boxesOpenState[0] = true
			box1.texture = load("res://Assets/Images/boxOpened.png")
			box1.z_index = 0
			$Box1/CollisionBox.disabled = true
		else:
			eventProcessed = false
	

func _on_box_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			boxesOpenState[1] = true
			box2.texture = load("res://Assets/Images/boxOpened.png")
			box2.z_index = 0
			$Box2/CollisionBox.disabled = true
		
		else:
			eventProcessed = false


func _on_box_3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			boxesOpenState[2] = true
			box3.texture = load("res://Assets/Images/boxOpened.png")
			box3.z_index = 0
			$Box3/CollisionBox.disabled = true
			
		else:
			eventProcessed = false

func _on_box_4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			boxesOpenState[3] = true
			box4.texture = load("res://Assets/Images/boxOpened.png")
			box4.z_index = 0

			$Box4/CollisionBox.disabled = true
		
		else:
			eventProcessed = false

func _on_wires_area_1_input_event(viewport, event, shape_idx):
	if wiresPosition == 0 and boxesOpenState[0] == true and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			wire1.texture = load("res://Assets/Images/stringsCut.png")
			wireStatus = "CUT"
		else:
			eventProcessed = false

func _on_wires_area_2_input_event(viewport, event, shape_idx):
	if wiresPosition == 1 and boxesOpenState[1] == true and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			wire2.texture = load("res://Assets/Images/stringsCut.png")
			wireStatus = "CUT"
		else:
			eventProcessed = false

func _on_wires_area_3_input_event(viewport, event, shape_idx):
	if wiresPosition == 2 and boxesOpenState[2] == true and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			wire3.texture = load("res://Assets/Images/stringsCut.png")
			wireStatus = "CUT"
		else:
			eventProcessed = false

func _on_wires_area_4_input_event(viewport, event, shape_idx):
	if wiresPosition == 3 and boxesOpenState[3] == true and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not eventProcessed:
			eventProcessed = true
			wire4.texture = load("res://Assets/Images/stringsCut.png")
			wireStatus = "CUT"
		else:
			eventProcessed = false
