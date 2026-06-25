extends Node2D


signal direction_input
signal look_at_input
signal form_change
signal fire_shot


var team: String = "player"
var direction: Vector2 = Vector2.ZERO
var desired_switch: String = "square"


func _ready() -> void:
	set_process(false)
	set_physics_process(false)


func _physics_process(_delta: float) -> void:
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("character_up"):
		direction += Vector2(0, -1)
	if Input.is_action_pressed("character_down"):
		direction += Vector2(0, 1)
	if Input.is_action_pressed("character_right"):
		direction += Vector2(1, 0)
	if Input.is_action_pressed("character_left"):
		direction += Vector2(-1, 0)
	direction = direction.normalized()
	direction_input.emit(direction)
	
	if Input.is_action_just_pressed("fire"):
		fire_shot.emit()


func _process(_delta: float) -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var turret_pos: Vector2 = get_parent().get_node("Turret").global_position
	var error: Vector2 = mouse_pos - turret_pos
	var angle: float = atan2(error.y, error.x)
	
	look_at_input.emit(angle)


func form_change_prompter() -> void:
	form_change.emit(desired_switch)
