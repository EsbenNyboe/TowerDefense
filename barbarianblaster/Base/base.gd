extends Node3D

@export var max_health: int = 5
@onready var label_3d: Label3D = $Label3D

var health: int:
	set(value):
		health = value
		label_3d.text = str(health) + "/" + str(max_health)
		if health < 1:
			get_tree().reload_current_scene()

func take_damage() -> void:
	health -= 1

func _ready() -> void:
	health = max_health
