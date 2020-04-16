extends KinematicBody2D

const FLOOR_NORMAL : = Vector2(0, -1)

var speed : = 100.0
var velocity : = Vector2()
var target_speed : = 0.0
var is_jumping : = false
var life : = 100

onready var animated_sprite : = $AnimatedSprite as AnimatedSprite
onready var rayCast_right : = $RayCastGroup/RayCastRight as RayCast2D

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
	
	velocity.y += Global.gravity * delta
	velocity.x = lerp(velocity.x, target_speed, .1)
	if abs(velocity.x) < 1:
		velocity.x = 0
	
	var snap : = Vector2.DOWN * 8 if !is_jumping else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap, FLOOR_NORMAL)
	
	if is_on_floor():
		is_jumping = false
	
	if !is_on_floor() && self.position.y > 512:
		life = -1
	
	if life <= 0:
		print("Sei morto")
	
func get_inputs() -> void:
	#if Input.is_action_pressed("ui_up") && is_on_floor():
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		$sfx_jump.play()
		velocity.y = Global.jump_speed
		is_jumping = true
	
	target_speed = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed

func damage() -> void:
	life -= 1
	print(life)
