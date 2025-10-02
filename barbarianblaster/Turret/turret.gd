extends Node3D

@export var projectile : PackedScene
@export var turret_range: float = 10.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var turret_base: Node3D = $TurretBase
@onready var cannon: Node3D = $TurretBase/Cannon

var enemy_path: Path3D
var target: PathFollow3D

func _physics_process(delta: float) -> void:
	target = find_best_target()
	if !target:
		return
	#var corrected_enemy_position = target.global_position
	#corrected_enemy_position.y = global_position.y
	turret_base.look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target:
		shoot()

func shoot() -> void:
	animation_player.play("fire")
	var shot = projectile.instantiate()
	add_child(shot)	
	shot.global_position = cannon.global_position
	shot.direction = cannon.global_transform.basis.z

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
