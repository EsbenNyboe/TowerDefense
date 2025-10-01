extends Path3D

@export var enemy_scene: PackedScene

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	var spawned_enemy = enemy_scene.instantiate()
	add_child(spawned_enemy)
