class_name Main extends Node2D

@onready var _player: Player = $Player
@onready var _hair_color_panel: HairColorPanel = $Interface/MarginContainer/Control/LeftContainer/HairColorPanel
@onready var _skin_tone_panel: SkinTonePanel = $Interface/MarginContainer/Control/LeftContainer/SkinTonePanel
@onready var _armor_panel: SelectionPanel = $Interface/MarginContainer/Control/LeftContainer/AmorPanel
@onready var _weapon_panel: SelectionPanel = $Interface/MarginContainer/Control/LeftContainer/WeaponPanel
@onready var _randomize_button: Button = $Interface/MarginContainer/Control/LeftContainer/RandomizeButton
@onready var _name_panel: NamePanel = $Interface/MarginContainer/Control/LeftContainer/NamePanel
@onready var _save_load_panel: SaveLoadPanel = $Interface/MarginContainer/Control/RightContainer/SaveLoadPanel

func _ready() -> void:
	_hair_color_panel.changed.connect(_on_hair_color_changed)
	_skin_tone_panel.changed.connect(_on_skin_tone_changed)
	_armor_panel.changed.connect(_on_armor_changed)
	_weapon_panel.changed.connect(_on_weapon_changed)
	_randomize_button.pressed.connect(_on_randomize_pressed)
	_name_panel.changed.connect(_on_name_changed)
	
	_save_load_panel.save_pressed.connect(_save_character)
	_save_load_panel.load_pressed.connect(_load_character)
	
	_load_character()
	
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
	
func _save_character() -> void:
	var save_file: FileAccess = FileAccess.open("res://character_save.json", FileAccess.WRITE)
	var character_data: Dictionary = _get_character_data()
	
	if save_file:
		save_file.store_string(JSON.stringify(character_data))
		save_file.close()
		
func _get_character_data() -> Dictionary:
	return {
		"name": _name_panel.get_input_text(),
		"hair_color": _hair_color_panel.get_color().to_html(),
		"skin_tone": _skin_tone_panel.get_tone(),
		"armor": _armor_panel.get_selected(),
		"weapon": _weapon_panel.get_selected()
	}
	
	
func _load_character() -> void:
	var load_file: FileAccess = FileAccess.open("res://character_save.json", FileAccess.READ)
	
	if load_file:
		var json_string: String = load_file.get_as_text()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		
		load_file.close()
		
		if parse_result == OK:
			_set_character_data(json.data)
			
func _set_character_data(character_data: Dictionary) -> void:
	_name_panel.set_input_text(character_data.name)
	_hair_color_panel.set_color(Color(character_data.hair_color))
	_skin_tone_panel.set_tone(character_data.skin_tone)
	_armor_panel.set_selected(character_data.armor)
	_weapon_panel.set_selected(character_data.weapon)
		
		
		
	
