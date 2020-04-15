extends KinematicBody2D

const FLOOR_NORMAL : = Vector2(0, -1)

var speed = 100.0
var velocity = Vector2()
var direction = 1

onready var animated_sprite : = $AnimatedSprite as AnimatedSprite
onready var raycast_vertical : = $RayCastVer as RayCast2D
onready var raycast_horrizontal : = $RayCastHor as RayCast2D

func _physics_process(delta: float) -> void:
	velocity.x = speed * direction
	
	if direction > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
	
	velocity.y += Global.gravity * delta

	velocity = move_and_slide(velocity, FLOOR_NORMAL)
	
	if raycast_horrizontal.is_colliding() || !raycast_vertical.is_colliding():
		direction = direction * -1
		raycast_vertical.position = raycast_vertical.position * -1
		raycast_horrizontal.scale.x = raycast_horrizontal.scale.x * -1
	
	if get_slide_count():
		for i in range(get_slide_count()):
			if get_slide_collision(i).get_collider().is_in_group("Players"):
				print("PLAYER")
