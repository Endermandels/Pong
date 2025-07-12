extends CharacterBody2D
class_name EnemyPaddle

@export_group("Internal Nodes")
@export var movement_component: MovementComponent
@export var input_component: InputComponent

func _physics_process(_delta: float) -> void:
    movement_component.handle_movement(self, input_component.input_vector)

    move_and_slide()
