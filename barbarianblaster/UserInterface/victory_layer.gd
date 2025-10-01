extends CanvasLayer

@export var retry_button : Button
@export var quit_button : Button

func _ready() -> void:
	retry_button.pressed.connect(get_tree().reload_current_scene)
	quit_button.pressed.connect(get_tree().quit)
