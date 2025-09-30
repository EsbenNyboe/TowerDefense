extends Node3D

@export var projectile : PackedScene
@onready var turret_barrel_2: MeshInstance3D = $TurretBase/TurretTop/TurretBarrel/TurretBarrel2

func _on_timer_timeout() -> void:
	shoot()

func shoot() -> void:
	var shot = projectile.instantiate()
	add_child(shot)	
	shot.global_position = turret_barrel_2.global_position
