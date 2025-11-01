class_name NamePanel extends PanelContainer

signal changed(name: String)

@onready var _line_edit: LineEdit = $VBoxContainer/LineEdit

func _ready() -> void:
	_line_edit.text_changed.connect(_on_text_changed)

func _on_text_changed(new_text: String) -> void:
	changed.emit(new_text)

func get_input_text() -> String:
	return _line_edit.text
	
func set_input_text(text: String) -> void:
	_line_edit.text = text
	changed.emit(text)
