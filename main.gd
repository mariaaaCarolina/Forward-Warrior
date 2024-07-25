extends Node2D

@export var game_ui: CanvasLayer
@export var game_over_ui_template: PackedScene
@export var start_ui: CanvasLayer
@export var mob_spawner: MobSpawner

func _ready():
	GameMananger.game_over.connect(trigger_game_over)
	if start_ui:
		start_ui.start_game_signal.connect(start_game)
		set_process(false)
		set_physics_process(false)
	
func start_game():
	# Verificar se o game_ui está definido
	if game_ui:
		game_ui.set_process(true)
		game_ui.set_physics_process(true)
	# Esconder a UI de início
	if start_ui:
		start_ui.hide()
	if mob_spawner:
		mob_spawner.start_spawning()

func trigger_game_over():
	#deletar gameUI
	if game_ui:
		game_ui.queue_free()
		game_ui = null
	#criar GameOerUI
	var game_over_ui: GameOverUI= game_over_ui_template.instantiate()
	add_child(game_over_ui)
	
