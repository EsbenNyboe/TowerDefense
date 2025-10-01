extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: Node
@onready var timer: Timer = $Timer

func spawn_enemy() -> void:
	var spawned_enemy = enemy_scene.instantiate()
	spawned_enemy.max_health = difficulty_manager.get_enemy_health()
	spawned_enemy.kill_reward = difficulty_manager.get_kill_reward()
	add_child(spawned_enemy)
	timer.wait_time = difficulty_manager.get_spawn_time()
