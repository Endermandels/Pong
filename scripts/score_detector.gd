extends Node
class_name ScoreDetector

@export_group("Settings")
@export var winning_score: int = 5

@export_group("External Nodes")
@export var ball: Ball
@export var left_bound: StaticBody2D
@export var right_bound: StaticBody2D

func _ready() -> void:
    GameStats.winning_score = winning_score
    ball.body_entered.connect(_on_ball_body_entered)

func _on_ball_body_entered(body: Node) -> void:
    if body == left_bound:
        GameStats.increase_p1_score()
    if body == right_bound:
        GameStats.increase_p2_score()
