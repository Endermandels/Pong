extends RigidBody2D
class_name Ball

@export_group("Settings")
@export var max_speed: float = 300 ## Ball's max speed
@export var cooldown: float = 2.0 ## Amount of time to allow players to recover after a score

var start_pos: Vector2 = Vector2(0, 0)
var reset_state: bool = false
var start_moving: bool = false

func _ready() -> void:
    start_pos = position
    reset_state = true
    GameStats.p1_scored.connect(_on_player_scored)
    GameStats.p2_scored.connect(_on_player_scored)
    GameStats.p1_won.connect(queue_free)
    GameStats.p2_won.connect(queue_free)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
    # Reset state of ball on player score
    if reset_state:
        state.transform = Transform2D(0.0, start_pos)
        state.linear_velocity = Vector2(0, 0)
        get_tree().create_timer(2).timeout.connect(_on_reset_timer_timeout)
        reset_state = false
    
    # Start moving when prompted to move
    if start_moving:
        state.linear_velocity = Vector2([-1, 1].pick_random(), [-randf_range(0.5, 1), randf_range(0.5, 1)].pick_random()) * max_speed
        start_moving = false

    # Make sure the ball is moving at a good horizontal speed
    if absf(state.linear_velocity.x) < max_speed / 2:
        state.linear_velocity.x = (max_speed / 2) * signf(state.linear_velocity.x)

    # Make sure the ball isn't moving at super sonic speeds
    if state.linear_velocity.length() > max_speed:
        state.apply_central_impulse(-state.linear_velocity.normalized() * (state.linear_velocity.length() / 100))

func _on_reset_timer_timeout() -> void:
    start_moving = true

func _on_player_scored() -> void:
    reset_state = true
