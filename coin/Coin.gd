extends Area2D

var pick_coin = true


func _ready():
	$AnimationPlayer.play("default")


func _on_Coin_body_entered(body):
	if body.is_in_group("Players") && pick_coin:
		$sfx.play()
		self.visible = false
		pick_coin = false
		body.get_coin()


func _on_sfx_finished():
	queue_free()
