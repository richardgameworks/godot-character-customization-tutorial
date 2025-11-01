class_name SaveLoadPanel extends PanelContainer

signal save_pressed
signal load_pressed

@onready var _save_button: Button = $VBoxContainer/SaveButton
@onready var _load_button: Button = $VBoxContainer/LoadButton

func _ready() -> void:
	_save_button.pressed.connect(_on_save_pressed)
	_load_button.pressed.connect(_on_load_pressed)

func _on_save_pressed() -> void:
	save_pressed.emit()
	
func _on_load_pressed() -> void:
	load_pressed.emit()
