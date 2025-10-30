class_name NamePanel extends PanelContainer

signal changed(name: String)

@onready var _line_edit: LineEdit = $VBoxContainer/LineEdit

func _ready() -> void:
	_line_edit.text_changed.connect(_on_text_changed)

func _on_text_changed(new_text: String) -> void:
	changed.emit(new_text)
