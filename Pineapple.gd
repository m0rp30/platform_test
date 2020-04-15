extends Node2D

var pick_coin = true

func _on_Area2D_body_entered(body) -> void:
	if body.is_in_group("Players") && pick_coin:
		$sfx.play()
		print("Preso moneta")
		self.visible = false
		pick_coin = false

func _on_sfx_finished():
	queue_free()
