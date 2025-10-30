class_name SelectionPanel extends PanelContainer

signal changed(option: String)

@export var _label_text: String
@export var _options: Array[String]

@onready var _label: Label = $HBoxContainer/Label
@onready var _left_button: Button = $HBoxContainer/LeftButton
@onready var _right_button: Button = $HBoxContainer/RightButton

var _current_option: String

func _ready() -> void:
	_label.text = _label_text
	
	_left_button.pressed.connect(_select_previous)
	_right_button.pressed.connect(_select_next)

func _select_previous() -> void:
	var current_index = _options.find(_current_option)
	var previous_index = current_index - 1
	
	if previous_index < 0:
		previous_index = _options.size() - 1
		
	_current_option = _options[previous_index]
	changed.emit(_current_option)
	
func _select_next() -> void:
	var current_index = _options.find(_current_option)
	var next_index = current_index + 1
	
	if next_index >= _options.size():
		next_index = 0
		
	_current_option = _options[next_index]
	changed.emit(_current_option)
	
func pick_random() -> void:
	_current_option = _options.pick_random()
	changed.emit(_current_option)
	
	
