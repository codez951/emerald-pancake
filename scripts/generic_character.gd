class_name GenericCharacter
extends CharacterBody2D


var team: String
var shape: String
var triangle: PackedScene = preload("res://scenes/triangle.tscn")
var square: PackedScene = preload("res://scenes/square.tscn")
var direction: Vector2 = Vector2.ZERO
var speed: float = 500


func move_in_direction(dir: Vector2):
	dir = dir.normalized()
	velocity = speed * dir
	move_and_slide()


func _ready() -> void:
	get_node("Turret").team = "player"
