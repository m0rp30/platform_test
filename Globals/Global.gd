extends Node

var cell_size : int = 16
var gravity : int = 1000
var jump_speed : float = -320
var life : int = 10
var player = AudioStreamPlayer.new()
var vstream = load("res://Assets/Sound/platform-game-theme-loop.wav")

func _ready():
	player.set_stream(vstream)
	add_child(player)
	player.add_to_group("streams")
	player.play()
	player.connect("finished", self, "on_finished")
	#player.emit_signal("finished")

func on_finished():
	player.play()
