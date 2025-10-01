extends MarginContainer

@export var starting_gold:= 150
@onready var label: Label = $Label

var gold: int:
	set(value):
		gold = max(value, 0)
		label.text = "gold: " + str(gold)

func _ready() -> void:
	gold = starting_gold
