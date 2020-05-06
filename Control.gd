extends Control

onready var resume = $MarginContainer/CenterContainer/VBoxContainer/TextureButtonResume
onready var exit = $MarginContainer/CenterContainer/VBoxContainer/TextureButtonExit


func _ready():
	resume.grab_focus()


func _physics_process(delta):
	if resume.is_hovered() == true:
		resume.grab_focus()
	if exit.is_hovered() == true:
		exit.grab_focus()


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		resume.grab_focus()
		set_paused()


func _on_TextureButtonResume_pressed():
	set_paused()


func _on_TextureButtonExit_pressed():
	set_paused()
	get_tree().change_scene("res://TitleScreen.tscn")


func set_paused():
	get_tree().paused = not get_tree().paused
	visible = not visible
