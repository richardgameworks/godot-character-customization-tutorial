class_name Main extends Node2D

@onready var _player: Player = $Player
@onready var _hair_color_panel: HairColorPanel = $Interface/MarginContainer/Control/LeftContainer/HairColorPanel
@onready var _skin_tone_panel: SkinTonePanel = $Interface/MarginContainer/Control/LeftContainer/SkinTonePanel
@onready var _armor_panel: SelectionPanel = $Interface/MarginContainer/Control/LeftContainer/AmorPanel
@onready var _weapon_panel: SelectionPanel = $Interface/MarginContainer/Control/LeftContainer/WeaponPanel
@onready var _randomize_button: Button = $Interface/MarginContainer/Control/LeftContainer/RandomizeButton
@onready var _name_panel: NamePanel = $Interface/MarginContainer/Control/LeftContainer/NamePanel

func _ready() -> void:
	_hair_color_panel.changed.connect(_on_hair_color_changed)
	_skin_tone_panel.changed.connect(_on_skin_tone_changed)
	_armor_panel.changed.connect(_on_armor_changed)
	_weapon_panel.changed.connect(_on_weapon_changed)
	_randomize_button.pressed.connect(_on_randomize_pressed)
	_name_panel.changed.connect(_on_name_changed)
	
func _on_hair_color_changed(color: Color) -> void:
	_player.change_hair_color(color)
	
func _on_skin_tone_changed(skin_tone: String) -> void:
	_player.change_skin_tone(skin_tone)

func _on_armor_changed(armor: String) -> void:
	_player.swap_armor(armor)
	
func _on_weapon_changed(weapon: String) -> void:
	_player.swap_weapon(weapon)

func _on_randomize_pressed() -> void:
	_hair_color_panel.pick_random()
	_skin_tone_panel.pick_random()
	_armor_panel.pick_random()
	_weapon_panel.pick_random()
	
func _on_name_changed(new_name: String) -> void:
	_player.change_name(new_name)
	
	
	
