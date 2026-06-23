class_name Bullet
extends Area2D


var team: String
var speed: float = 5000
var launch_state: bool = false
var direction: Vector2
var blue_bullet_texture := preload("res://assets/textures/blue_bullet_1.png") 
var red_bullet_texture := preload("res://assets/textures/red_bullet_1.png")


func setup(turret_team):
	team = turret_team
	if team == "player":
		get_node("BulletTexture").texture = blue_bullet_texture


func launch(angle):
	direction = Vector2.from_angle(angle)
	launch_state = true


func _physics_process(delta: float) -> void:
	if launch_state:
		global_position += speed * direction * delta
