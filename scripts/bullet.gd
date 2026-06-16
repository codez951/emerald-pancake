class_name Bullet

extends Area2D


var speed: float = 5000
var launch_state: bool = false
var direction: Vector2


func launch(angle):
	direction = Vector2.from_angle(angle)
	launch_state = true


func _physics_process(delta: float) -> void:
	if launch_state:
		global_position += speed * direction * delta
