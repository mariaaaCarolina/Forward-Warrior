class_name GameStartUI
extends CanvasLayer

@export var start_delay: float = 5.0
var start_cooldown: float

signal start_game_signal

func _ready():
	start_cooldown = start_delay
	
func _process(delta):
	start_cooldown -= delta
	if start_cooldown <= 0.0:
		start_game()
		
func start_game():
	#GameMananger.reset()
	#get_tree().reload_current_scene()	
	emit_signal("start_game_signal")
				
