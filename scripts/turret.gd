extends Node2D


var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")
var blue_bullet_texture := preload("res://assets/textures/blue_bullet_1.png") 
var red_bullet_texture := preload("res://assets/textures/red_bullet_1.png")


func turret_aiming_direction(rotate_by):
	rotation = rotate_by


func fire(firing_team):
	var turret_head: Vector2 = get_node("BulletSpawnPoint").global_position
	var bullet = bullet_scene.instantiate()
	
	if firing_team == "player":
		bullet.get_node("BulletTexture").texture = blue_bullet_texture
		print(get_node("BulletSpawnPoint").global_position)
		bullet.global_position = get_node("BulletSpawnPoint").global_position
		add_child(bullet)
