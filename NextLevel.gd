extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("Players"):
			get_tree().change_scene("res://Lev3.tscn")
