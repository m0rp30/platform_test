extends KinematicBody2D

signal update_life()
signal update_coin()

const FLOOR_NORMAL : = Vector2(0, -1)

var jump_speed : = Global.jump_speed
var gravity : = Global.gravity
var life : = Global.life

var speed : = 100.0
var velocity : = Vector2()
var target_speed : = 0.0
var is_jumping : = false

var timer = 0

onready var animated_sprite : = $AnimatedSprite as AnimatedSprite
onready var animation : = $AnimationPlayer as AnimationPlayer
onready var foot : Node2D = $Foot as Node2D


func _process(_delta) -> void:
	if velocity.x < 0:
		animated_sprite.flip_h = true
	elif velocity.x > 0:
		animated_sprite.flip_h = false
	
	if velocity.x != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	if !is_on_floor():
		animated_sprite.play("jump")


func _physics_process(delta: float) -> void:
	get_inputs()
	get_enemy_reycast()
	
	velocity.y += gravity * delta
	velocity.x = lerp(velocity.x, target_speed, .1)
	if abs(velocity.x) < 1:
		velocity.x = 0
	
	var snap : = Vector2.DOWN * 8 if !is_jumping else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap, FLOOR_NORMAL)
	
	if is_on_floor():
		is_jumping = false
	
	if !is_on_floor() && self.position.y > 512:
		life = -1
		emit_signal("update_life", life)
	
	if life <= 0:
		velocity.y = jump_speed
		animation.play("deat")
		timer += 1 * delta
		if timer > 1:
			get_tree().change_scene("res://TitleScreen.tscn")


func get_inputs() -> void:
	#if Input.is_action_pressed("ui_up") && is_on_floor():
	if (Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("ui_up"))  && is_on_floor():
		$sfx_jump.play()
		velocity.y = jump_speed
		is_jumping = true
	
	target_speed = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed


func get_enemy_reycast() -> void:
	for ray in foot.get_children():
		var collider = ray.get_collider()
		if collider && collider.is_in_group("Enemies"):
			velocity.y = jump_speed * .5
			collider.damage()
		elif collider && collider.is_in_group("Trappole"):
			velocity.y = jump_speed * .5
			life = 0


func damage() -> void:
	if animation.is_playing():
		return
	life -= 1
	animation.play("damage")
	emit_signal("update_life", life)


func get_coin():
	emit_signal("update_coin")
