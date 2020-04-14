extends Node2D

onready var animation = $AnimationPlayer as AnimationPlayer

func _ready():
	animation.play("idle")


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("Get pinapple !")
		queue_free()
