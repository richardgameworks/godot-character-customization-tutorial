class_name Player extends CharacterBody2D

@onready var _body_sprite: AnimatedSprite2D = $Skeleton/Body
@onready var _armor_sprite: AnimatedSprite2D = $Skeleton/Armor
@onready var _head_sprite: AnimatedSprite2D = $Skeleton/Head
@onready var _eyes_sprite: AnimatedSprite2D = $Skeleton/Eyes
@onready var _hair_sprite: AnimatedSprite2D = $Skeleton/Hair
@onready var _weapon_sprite: AnimatedSprite2D = $Skeleton/Weapon

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
