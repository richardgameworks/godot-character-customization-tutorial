class_name Main extends Node2D

@onready var _player: Player = $Player
@onready var _hair_color_panel: HairColorPanel = $Interface/MarginContainer/Control/LeftContainer/HairColorPanel
@onready var _skin_tone_panel: SkinTonePanel = $Interface/MarginContainer/Control/LeftContainer/SkinTonePanel

func _ready() -> void:
	_hair_color_panel.changed.connect(_on_hair_color_changed)
	_skin_tone_panel.changed.connect(_on_skin_tone_changed)
	
func _on_hair_color_changed(color: Color) -> void:
	_player.change_hair_color(color)
	
func _on_skin_tone_changed(skin_tone: String) -> void:
	_player.change_skin_tone(skin_tone)
