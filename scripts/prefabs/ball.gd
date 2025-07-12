extends RigidBody2D
class_name Ball

@export_group("Settings")
@export var max_speed: float = 300
@export var start_vector: Vector2 = Vector2(1, 1)

func _ready() -> void:
    linear_velocity = start_vector * max_speed

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
    # Make sure the ball is moving at a good horizontal speed
    if absf(state.linear_velocity.x) < max_speed / 2:
        state.linear_velocity.x = (max_speed / 2) * signf(state.linear_velocity.x)

    # Make sure the ball isn't moving at super sonic speeds
    if state.linear_velocity.length() > max_speed:
        state.apply_central_impulse(-state.linear_velocity.normalized() * (state.linear_velocity.length() / 100))
