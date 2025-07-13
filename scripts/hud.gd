extends Control
class_name HUD

@export_group("Internal Nodes")
@export var p1_score_label: Label
@export var p2_score_label: Label

func _ready() -> void:
    GameStats.p1_scored.connect(_on_p1_scored)
    GameStats.p2_scored.connect(_on_p2_scored)

func _on_p1_scored():
    p1_score_label.text = str(GameStats.p1_score)

func _on_p2_scored():
    p2_score_label.text = str(GameStats.p2_score)
