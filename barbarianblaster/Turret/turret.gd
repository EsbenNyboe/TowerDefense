extends Node3D

@export var projectile : PackedScene

func shoot() -> void:
	var shot = projectile.instantiate()
	add_child(shot)	
