extends CharacterBody2D
class_name Ball

@export_group("Internal Nodes")
@export var movement_component: MovementComponent

var input_vector: Vector2 = Vector2(1, 1)

func _physics_process(_delta: float) -> void:
	movement_component.handle_movement(self, input_vector)

	move_and_slide()
