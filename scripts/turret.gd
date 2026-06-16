extends Node2D

func turret_aiming_direction(rotate_by):
	rotation = rotate_by


func fire():
	var turret_head: Vector2 = $Marker2D.global_position
