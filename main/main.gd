class_name Main extends Node2D

@export var _player: Player
@export var _hair_color_panel: HairColorPanel

func _ready() -> void:
	_hair_color_panel.changed.connect(_on_hair_color_changed)

func _on_hair_color_changed(color: Color) -> void:
	_player.change_hair_color(color)
