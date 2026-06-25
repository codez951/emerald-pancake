class_name GenericCharacter
extends CharacterBody2D


var team: String
var shape: String
var triangle: PackedScene = preload("res://scenes/real_triangle.tscn")
var square: PackedScene = preload("res://scenes/real_square.tscn")
var direction: Vector2 = Vector2.ZERO
var speed: float = 500
var hp: float
var atk: float


func move_in_direction(dir: Vector2) -> void:
	dir = dir.normalized()
	velocity = speed * dir
	move_and_slide()


func _ready() -> void:
	get_node("Turret").team = "player"


func _on_player_controller_direction_input() -> void:
	pass # Replace with function body.
