extends Node2D

onready var tween : = $Tween as Tween
onready var kinematic : = $Kinematic as KinematicBody2D

export var idle_duration = 1.0
export var move_to = Vector2.RIGHT * 192
export var speed = 3.0

var follow = Vector2.ZERO

func _ready():
	_init_tween()

func _init_tween():
	var duration = move_to.length() / float(speed * Global.cell_size)
	tween.interpolate_property(self, "follow", Vector2.ZERO, move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT,
	idle_duration)
	tween.interpolate_property(self, "follow", move_to, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT,
	duration + idle_duration * 2)
	tween.start()

func _physics_process(delta):
	kinematic.position = kinematic.position.linear_interpolate(follow, 0.075)
