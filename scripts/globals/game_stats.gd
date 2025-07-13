extends Node

var p1_score: int = 0
var p2_score: int = 0
var winning_score: int = 5

signal p1_won
signal p2_won
signal p1_scored
signal p2_scored

func increase_p1_score() -> void:
    p1_score += 1
    p1_scored.emit()
    if p1_score >= winning_score:
        p1_won.emit()

func increase_p2_score() -> void:
    p2_score += 1
    p2_scored.emit()
    if p2_score >= winning_score:
        p2_won.emit()
