class_name HairColorPanel extends PanelContainer

signal changed(color: Color)

@onready var _color_picker: ColorPicker = $VBoxContainer/ColorPicker

func _ready() -> void:
	_color_picker.color_changed.connect(_on_color_changed)
	
func _on_color_changed(color: Color) -> void:
	changed.emit(color)

func pick_random() -> void:
	var random_color: Color = Color(randf(), randf(), randf())
	
	_color_picker.color = random_color
	changed.emit(random_color)
	
func get_color() -> Color:
	return _color_picker.color
	
func set_color(color: Color) -> void:
	_color_picker.color = color
	changed.emit(color)
