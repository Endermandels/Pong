extends Node
class_name Game

func _unhandled_key_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel"):
        get_tree().quit()