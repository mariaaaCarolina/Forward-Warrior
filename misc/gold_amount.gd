extends Node2D

@export var gold_amount: int = 100
@onready var gold_label: Label = %GoldLabel

func _ready():
	$Area2D.body_entered.connect(on_body_entered)

func on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var player = body 
		player.amount += gold_amount
		player.emit_signal("gold_collected", gold_amount)
		queue_free()
