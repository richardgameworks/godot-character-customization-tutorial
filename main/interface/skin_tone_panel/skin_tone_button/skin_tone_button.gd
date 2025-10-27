class_name SkinToneButton extends Button

var skin_tone: String

@onready var _color_rect: ColorRect = $MarginContainer/ColorRect

func _ready() -> void:
	_color_rect.color = Global.SKIN_TONES[skin_tone]
