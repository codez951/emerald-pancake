class_name GenericCharacter
extends CharacterBody2D


var team: String
var shape: String
var direction: Vector2 = Vector2.ZERO
var speed: float = 500
var hp: float
var atk: float
var scene: PackedScene
var current_form: String = "none"
var target_shape: CharacterBody2D


func _ready() -> void:
	if current_form == "none":
		form_changer("square")
		return
	team_setter("player")
	get_node("PlayerController").set_process(true)
	get_node("PlayerController").set_physics_process(true)


func _physics_process(_delta: float) -> void:
	move_and_slide()


func setup(previous: GenericCharacter) -> void:
	global_position = previous.global_position
	global_rotation = previous.global_rotation
	team = previous.team


func _on_player_controller_direction_input(dir: Vector2) -> void:
	velocity = speed * dir


func _on_player_controller_fire_shot() -> void:
	get_node("Turret").fire()


func _on_player_controller_look_at_input(angle: float) -> void:
	get_node("Turret").turret_aiming_direction(angle)


func form_changer(desired_switch: String) -> void:
	if desired_switch == "square":
		scene = load("res://scenes/real_square.tscn")
	elif desired_switch == "triangle":
		scene = load("res://scenes/real_triangle.tscn")
	
	target_shape = scene.instantiate()
	target_shape.setup(self)
	add_sibling.call_deferred(target_shape)
	queue_free()


func team_setter(target_team) -> void:
	team = target_team
	get_node("Turret").team = team
