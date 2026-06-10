extends CharacterBody2D


var direction: Vector2 = Vector2.ZERO
var speed: float = 500
var hp: float
var attack: float


func move_in_direction(dir: Vector2):
	dir = dir.normalized()
	velocity = speed * dir
	move_and_slide()
