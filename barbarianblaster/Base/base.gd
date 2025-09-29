extends Node3D

@export var max_health: int = 5
@onready var label_3d: Label3D = $Label3D

var health: int

func take_damage() -> void:
	print("take damage")
	set_health(health - 1)

func _ready() -> void:
	set_health(max_health)

func set_health(new_value: int) -> void:
	health = new_value
	label_3d.text = str(new_value)
