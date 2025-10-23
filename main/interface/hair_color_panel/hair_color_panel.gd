class_name HairColorPanel extends PanelContainer

signal changed(color: Color)

@export var _color_picker: ColorPicker

func _ready() -> void:
	_color_picker.color_changed.connect(_on_color_changed)

func _on_color_changed(color: Color) -> void:
	changed.emit(color)
