extends Node
class_name BallCollisionHandler

@export_group("External Nodes")
@export var ball: Ball
@export var left_bound: StaticBody2D
@export var right_bound: StaticBody2D
@export var top_bound: StaticBody2D
@export var bottom_bound: StaticBody2D

@export_group("Internal Nodes")
@export var border_sound: AudioStreamPlayer
@export var paddle_sound: AudioStreamPlayer
@export var score_sound: AudioStreamPlayer

var pitch_variance = [1.0, 1.2]

func _ready() -> void:
    ball.body_entered.connect(_on_ball_body_entered)

func _on_ball_body_entered(body: Node) -> void:
    if body == left_bound:
        GameStats.increase_p2_score()
        score_sound.pitch_scale = randf_range(pitch_variance[0], pitch_variance[1])
        score_sound.play()
    if body == right_bound:
        GameStats.increase_p1_score()
        score_sound.pitch_scale = randf_range(pitch_variance[0], pitch_variance[1])
        score_sound.play()
    if body == top_bound or body == bottom_bound:
        border_sound.pitch_scale = randf_range(pitch_variance[0], pitch_variance[1])
        border_sound.play()
    else:
        paddle_sound.pitch_scale = randf_range(pitch_variance[0], pitch_variance[1])
        paddle_sound.play()

