class_name Player extends CharacterBody2D

@onready var _body_sprite: AnimatedSprite2D = $Skeleton/Body
@onready var _armor_sprite: AnimatedSprite2D = $Skeleton/Armor
@onready var _head_sprite: AnimatedSprite2D = $Skeleton/Head
@onready var _eyes_sprite: AnimatedSprite2D = $Skeleton/Eyes
@onready var _hair_sprite: AnimatedSprite2D = $Skeleton/Hair
@onready var _weapon_sprite: AnimatedSprite2D = $Skeleton/Weapon
@onready var _name_label: Label = $NameLabelControl/NameLabel

var _sprites: Array[AnimatedSprite2D]

func _ready() -> void:
	_sprites = [_body_sprite, _armor_sprite, _head_sprite, _eyes_sprite, _hair_sprite, _weapon_sprite]
	_play_animation("idle_down")
	
func _play_animation(animation: String) -> void:
	for sprite in _sprites:
		sprite.play(animation)
		
func change_hair_color(hair_color: Color) -> void:
	_hair_sprite.modulate = hair_color

func change_skin_tone(skin_tone: String) -> void:
	_head_sprite.modulate = Global.SKIN_TONES[skin_tone]
	_body_sprite.modulate = Global.SKIN_TONES[skin_tone]
	
func swap_armor(armor: String) -> void:
	_swap_texture("armor", _armor_sprite, armor)
	
func swap_weapon(weapon: String) -> void:
	_swap_texture("weapon", _weapon_sprite, weapon)

func _swap_texture(player_part: String, sprite: AnimatedSprite2D, option: String) -> void:
	var current_frame = sprite.frame
	var current_animation = sprite.animation
	var sprite_frames = sprite.sprite_frames
	
	for anim_name in sprite_frames.get_animation_names():
		for frame_index in sprite_frames.get_frame_count(anim_name):
			var texture_path = _build_texture_path(player_part, option, anim_name)
			sprite_frames.get_frame_texture(anim_name, frame_index).atlas = load(texture_path)
	
	_sync_animation(current_frame, current_animation)

func _build_texture_path(player_part: String, texture_name: String, anim_name: String) -> String:
	var folder_path = "res://assets/spritesheets/player/" + player_part
	var animation = "run" if "run" in anim_name else "idle"
	return folder_path + "/" + texture_name + "_" + animation + ".png"
	
func _sync_animation(frame: int, animation: String) -> void:
	for sprite in _sprites:
		sprite.frame = frame
		sprite.play(animation)

func change_name(new_name: String) -> void:
	_name_label.text = new_name
	_name_label.visible = not new_name.is_empty()
	
	
