extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var climbing = false

@onready var animated_sprite_2d = $AnimatedSprite2D



func _physics_process(delta):
	if climbing == true:
		velocity.y = 0
		if Input.is_action_pressed("mupkey"):
			velocity.y = -SPEED
		elif Input.is_action_pressed("mdownkey"):
			velocity.y = SPEED
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jumpkey") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("mleftkey", "mrightkey")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("move")
	else:
		animated_sprite_2d.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	




func _on_a_2d_portal_1_body_entered(body):
	if body.is_in_group("Portal"):
		position.x = 225
		position.y = 825

func _on_a_2d_portal_2_body_entered(body):
	if body.is_in_group("Portal"):
		position.x = 425
		position.y = 75
