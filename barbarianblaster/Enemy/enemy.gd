extends PathFollow3D

@export var speed: float = 2.5
@export var max_health: int = 50
@export var kill_reward := 15

@onready var base = get_tree().get_first_node_in_group("base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("bank")

var health: int:
	set(value):
		if value < health:
			animation_player.play("TakeDamage")
		health = value
		if health < 1:
			bank.gold += kill_reward
			queue_free()

func _ready() -> void:
	health = max_health

func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio >= 1:
		base.take_damage()
		set_process(false)
		queue_free()

func take_damage(damage: int) -> void:
	health -= damage
