extends PathFollow3D

@export var speed: float = 2.5
@export var max_health: int = 50

@onready var base = get_tree().get_first_node_in_group("base")

var health: int:
	set(value):
		health = value
		if health < 1:
			queue_free()

func _ready() -> void:
	health = max_health

func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio >= 1:
		base.take_damage()
		set_process(false)

func take_damage(damage: int) -> void:
	health -= damage
