extends Node
class_name InputComponent

var input_vector: Vector2 = Vector2.ZERO ## Normalized input vector for moving

func _process(_delta: float) -> void:
	var v_dir: float = Input.get_axis("move_up_p1", "move_down_p1");
	input_vector = Vector2(0, v_dir).normalized()
