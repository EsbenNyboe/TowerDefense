extends Node

@export var game_length := 30.0
@export var spawn_time_curve: Curve
@export var enemy_health_curve: Curve
@export var kill_reward_curve: Curve
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start(game_length)

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left / game_length)

func get_spawn_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())

func get_enemy_health() -> float:
	return enemy_health_curve.sample(game_progress_ratio())

func get_kill_reward() -> float:
	return kill_reward_curve.sample(game_progress_ratio())
