extends Node2D


var team: String
var can_fire: bool = true
var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")


func turret_aiming_direction(rotate_by) -> void:
	rotation = rotate_by


func fire() -> void:
	if can_fire:
		get_node("ReloadTimer").start()
		var turret_head: Vector2 = get_node("BulletSpawnPoint").global_position
		var bullet = bullet_scene.instantiate()
		
		if team == "player":
			bullet.setup(team)
			get_tree().root.add_child(bullet)
			bullet.global_position = turret_head
			bullet.launch(global_rotation)
		
		can_fire = false


func _on_reload_timer_timeout() -> void:
	can_fire = true
