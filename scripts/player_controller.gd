extends Node2D


var direction: Vector2 = Vector2.ZERO
var player_form: String = "square"
var player_shape: CharacterBody2D
var triangle: PackedScene = preload("res://scenes/triangle.tscn")
var square: PackedScene = preload("res://scenes/square.tscn")


func _ready() -> void:
	form_loader()


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
	if Input.is_action_just_pressed("fire"):
		print("Fire")
		player_shape.get_node("Turret").fire("player")
		
	player_shape.move_in_direction(direction)


func _process(_delta: float) -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var turret_pos: Vector2 = player_shape.get_node("Turret").global_position
	var error: Vector2 = mouse_pos - turret_pos
	var angle: float = atan2(error.y, error.x)
	
	player_shape.get_node("Turret").turret_aiming_direction(angle)


func form_loader():
	if player_form == "square":
		player_shape = square.instantiate()
	if player_form == "triangle":
		player_shape = triangle.instantiate()
		
	add_child(player_shape)
