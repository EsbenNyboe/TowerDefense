extends Node3D

@export var projectile : PackedScene
@onready var turret_barrel_2: MeshInstance3D = $TurretBase/TurretTop/TurretBarrel/TurretBarrel2

var enemy_path: Path3D

func _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	var corrected_enemy_position = enemy.global_position
	corrected_enemy_position.y = global_position.y
	look_at(corrected_enemy_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	shoot()

func shoot() -> void:
	var shot = projectile.instantiate()
	add_child(shot)	
	shot.global_position = turret_barrel_2.global_position
	shot.direction = global_transform.basis.z
