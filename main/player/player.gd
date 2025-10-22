class_name Player extends CharacterBody2D

@export var _body_sprite: AnimatedSprite2D
@export var _armor_sprite: AnimatedSprite2D
@export var _head_sprite: AnimatedSprite2D
@export var _eyes_sprite: AnimatedSprite2D
@export var _hair_sprite: AnimatedSprite2D
@export var _weapon_sprite: AnimatedSprite2D

var _sprites: Array[AnimatedSprite2D]

func _ready() -> void:
	_sprites = [_body_sprite, _armor_sprite, _head_sprite, _eyes_sprite, _hair_sprite, _weapon_sprite]
	_play_animation("idle_down")
	
func _play_animation(animation: String) -> void:
	for sprite in _sprites:
		sprite.play(animation)
