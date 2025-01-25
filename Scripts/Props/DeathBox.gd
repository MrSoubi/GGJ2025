extends Area2D

const RSE_ON_PLAYER_DEATH = preload("res://Data/RSE_OnPlayerDeath.tres")

func _on_body_entered(body: Node2D) -> void:
	if body is BubbleController:
		RSE_ON_PLAYER_DEATH.triggered.emit()
