extends CharacterBody2D


var direction: Vector2 = Vector2.ZERO
var speed: float = 500


func _process(delta: float) -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var turret_pos: Vector2 = $Turret.global_position
	var error: Vector2 = mouse_pos - turret_pos
	var angle: float = atan2(error.y, error.x)
	
	$Turret.turret_movement(angle)


func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("character_up"):
		direction += Vector2(0, -1)
	if Input.is_action_pressed("character_down"):
		direction += Vector2(0, 1)
	if Input.is_action_pressed("character_right"):
		direction += Vector2(1, 0)
	if Input.is_action_pressed("character_left"):
		direction += Vector2(-1, 0)
	if Input.is_action_just_pressed("fire"):
		print("Fire")
	
	direction = direction.normalized()
	velocity = speed * direction
	move_and_slide()
