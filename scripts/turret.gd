extends Node2D


var can_fire = true
var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")
var blue_bullet_texture := preload("res://assets/textures/blue_bullet_1.png") 
var red_bullet_texture := preload("res://assets/textures/red_bullet_1.png")


func turret_aiming_direction(rotate_by):
	rotation = rotate_by


func fire(firing_team):
	if can_fire:
		get_node("ReloadTimer").start()
		var turret_head: Vector2 = get_node("BulletSpawnPoint").global_position
		var bullet = bullet_scene.instantiate()
		
		if firing_team == "player":
			bullet.get_node("BulletTexture").texture = blue_bullet_texture
			get_tree().root.add_child(bullet)
			bullet.global_position = turret_head
			bullet.launch(global_rotation)
		
		can_fire = false


func _on_reload_timer_timeout() -> void:
	can_fire = true
