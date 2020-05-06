extends Control

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/tb_start_game.grab_focus()


func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/tb_start_game.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/tb_start_game.grab_focus()
	
	if $MarginContainer/VBoxContainer/VBoxContainer/tb_exit.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/tb_exit.grab_focus()


func _on_tb_start_game_pressed():
	self.call_deferred("free")
	get_tree().change_scene("res://Lev1.tscn")


func _on_tb_exit_pressed():
	get_tree().quit()
