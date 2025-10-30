class_name Player extends CharacterBody2D

@onready var _body_sprite: AnimatedSprite2D = $Skeleton/Body
@onready var _armor_sprite: AnimatedSprite2D = $Skeleton/Armor
@onready var _head_sprite: AnimatedSprite2D = $Skeleton/Head
@onready var _eyes_sprite: AnimatedSprite2D = $Skeleton/Eyes
@onready var _hair_sprite: AnimatedSprite2D = $Skeleton/Hair
@onready var _weapon_sprite: AnimatedSprite2D = $Skeleton/Weapon
@onready var _name_label: Label = $NameLabelControl/NameLabel

var _sprites: Array[AnimatedSprite2D]

var _speed: float = 100
var _current_movement: String = "idle"
var _current_direction: String = "down"

func _ready() -> void:
	_sprites = [_body_sprite, _armor_sprite, _head_sprite, _eyes_sprite, _hair_sprite, _weapon_sprite]
	_play_animation("idle_down")
	
func _physics_process(_delta: float) -> void:
	_update_animation()
	
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
	
func _update_animation() -> void:
	var input_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var new_movement: String = _get_movement(input_vector)
	var new_direction: String = _get_direction(input_vector)
	var new_animation: String = new_movement + "_" + new_direction
	var current_animation: String = _current_movement + "_" + _current_direction
	
	if new_animation != current_animation:
		_current_movement = new_movement
		_current_direction = new_direction
		
		_play_animation(new_animation)
	
	velocity = input_vector * _speed
	move_and_slide()

func _get_movement(input_vector: Vector2) -> String:
	return "run" if input_vector.length() > 0 else "idle"

func _get_direction(input_vector: Vector2) -> String:
	if input_vector.length() == 0: 
		return _current_direction
	
	if abs(input_vector.x) > abs(input_vector.y):
		return "right" if input_vector.x > 0 else "left"
	
	return "up" if input_vector.y < 0 else "down"
