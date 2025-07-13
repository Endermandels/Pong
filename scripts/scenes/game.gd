extends Node
class_name Game

@export_group("Settings")
@export var winning_score: int = 5

@export_group("Internal Nodes")
@export var win_sound: AudioStreamPlayer

func _ready() -> void:
    GameStats.winning_score = winning_score
    GameStats.p1_won.connect(win_sound.play)
    GameStats.p2_won.connect(win_sound.play)

func _unhandled_key_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel"):
        get_tree().quit()