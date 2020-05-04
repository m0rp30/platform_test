extends Area2D

var timer = 0

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("Players"):
			timer += 1 * delta
			if timer > 1:
				get_tree().change_scene("res://Lev2.tscn")
