extends Node3D

@export var projectile : PackedScene
@export var turret_range: float = 10.0

@onready var turret_barrel_2: MeshInstance3D = $TurretBase/TurretTop/TurretBarrel/TurretBarrel2

var enemy_path: Path3D
var target: PathFollow3D

func _physics_process(delta: float) -> void:
	target = find_best_target()
	if !target:
		return
	var corrected_enemy_position = target.global_position
	corrected_enemy_position.y = global_position.y
	look_at(corrected_enemy_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target:
		shoot()

func shoot() -> void:
	var shot = projectile.instantiate()
	add_child(shot)	
	shot.global_position = turret_barrel_2.global_position
	shot.direction = global_transform.basis.z

func find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress = 0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			if enemy.progress > best_progress:
				var distance := global_position.distance_to(enemy.global_position)
				if distance < turret_range:
					best_target = enemy
					best_progress = enemy.progress
	return best_target
