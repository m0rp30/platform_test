extends Area2D

export var next_level = ""


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("Players"):
			print("Contatto!!!")
			get_tree().change_scene(next_level)
