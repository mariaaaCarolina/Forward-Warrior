class_name GameOverUI
extends CanvasLayer

@onready var timer_label: Label = %TimerLabel
@onready var monsters_label: Label = %MonstersLabel
@onready var gold_collected: Label = %GoldsLabel

@export var restart_delay: float = 10.0
var restart_cooldown: float

func _ready():
	timer_label.text = GameMananger.time_elapsed_string
	monsters_label.text = str(GameMananger.monsters_defeated_counter)
	gold_collected.text = str(GameMananger.gold_counter)
	restart_cooldown = restart_delay
	
func _process(delta):
	restart_cooldown -= delta
	if restart_cooldown <= 0.0:
		restart_game()
		
func restart_game():
	GameMananger.reset()
	get_tree().reload_current_scene()	
		
	
