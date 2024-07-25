extends Node

@export var speed = 1.0

var sprite: AnimatedSprite2D
var enemy: Enemy

func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")

func _physics_process(delta: float) -> void:
	#ignorar gameOver
	if GameMananger.is_game_over: return
	
	#calcular direção 
	var player_position = GameMananger.player_position
	var difference = player_position - enemy.position
	var input_vector = difference.normalized()
	
	#andar
	enemy.velocity = input_vector * speed * 200.0
	enemy.move_and_slide()
	
	#girar sprite
	if input_vector.x > 0:
		sprite.flip_h = false
		
		#desmarcar flip.h do sprite
	elif input_vector.x < 0:
		sprite.flip_h = true
		#marcar o flip.h do sprite				
		
