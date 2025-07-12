extends Node
class_name InputComponent

@export_group("Settings")
@export var p1: bool = true ## Whether input controls are for player 1 or 2

var input_vector: Vector2 = Vector2.ZERO ## Normalized input vector for moving

func _process(_delta: float) -> void:
    var player_str = "p1" if p1 else "p2"
    var v_dir: float = Input.get_axis("move_up_" + player_str, "move_down_" + player_str);
    input_vector = Vector2(0, v_dir).normalized()
