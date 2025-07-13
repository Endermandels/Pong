extends Control
class_name HUD

@export_group("Internal Nodes")
@export var p1_score_label: Label
@export var p2_score_label: Label
@export var p1_won_label: Label
@export var p2_won_label: Label


func _ready() -> void:
	GameStats.p1_scored.connect(_on_p1_scored)
	GameStats.p2_scored.connect(_on_p2_scored)
	GameStats.p1_won.connect(_on_p1_won)
	GameStats.p2_won.connect(_on_p2_won)

func _on_p1_won():
	p1_won_label.show()

func _on_p2_won():
	p2_won_label.show()

func _on_p1_scored():
	p1_score_label.text = str(GameStats.p1_score)

func _on_p2_scored():
	p2_score_label.text = str(GameStats.p2_score)
