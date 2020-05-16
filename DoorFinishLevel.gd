extends Area2D

export(String, FILE, "*.tscn") var next_level


func _on_DoorFinishLevel_body_entered(body):
	if body.is_in_group("Players"):
		if get_tree().change_scene(next_level):
			print("ERROR: Impossible to change scene in ", next_level)
