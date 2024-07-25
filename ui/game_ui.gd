extends CanvasLayer

@onready var timer_label: Label = $TimerLabel
@onready var meat_label: Label = %MeatLabel
@onready var gold_label: Label = %GoldLabel


func _ready():
	meat_label.text = str(GameMananger.meat_counter)
	gold_label.text = str(GameMananger.gold_counter)
	var player = GameMananger.player
	if player:
		player.connect("meat_collected", Callable(self, "_on_meat_collected"))
		player.connect("gold_collected", Callable(self, "_on_gold_collected"))
	
func _process(delta: float):
	# Update timer
	timer_label.text = GameMananger.time_elapsed_string
	meat_label.text = str(GameMananger.meat_counter)
	gold_label.text = str(GameMananger.gold_counter)

func _on_meat_collected(value: int) -> void:
	meat_label.text = str(GameMananger.meat_counter)

func _on_gold_collected(value: int) -> void:
	gold_label.text = str(GameMananger.gold_counter)
