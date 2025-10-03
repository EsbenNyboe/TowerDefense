extends Camera3D

@export var speed := 44.0

func _physics_process(delta: float) -> void:
	var weight = clamp(delta * speed, 0, 1)
	global_transform = global_transform.interpolate_with(
		get_parent().global_transform, weight
	)
	global_position = get_parent().global_position
