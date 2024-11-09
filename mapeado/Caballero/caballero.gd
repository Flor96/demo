extends CharacterBody2D

@export var move_speed : float
@export var jump_speed : float

@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound
@onready var death_sound = $DeathSound
@onready var respawn_point = get_parent().get_node("RespawnPoint").global_position

var is_dead = false
var is_facing_right = true
var gravity =  ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if is_dead:
		return
	jump(delta)
	move_x()
	flip()
	move_and_slide()
	update_animations()

func update_animations():
	if is_dead:
		return

	if not is_on_floor():
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
		return

	if velocity.x:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")

func jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jump_speed
		jump_sound.play()
	elif not is_on_floor():
		velocity.y += gravity * delta
 
func flip():
	if (is_facing_right and velocity.x <0) or (not is_facing_right and velocity.x >0):
		scale.x *= -1
		is_facing_right = not is_facing_right

func move_x():
	var input_axis = Input.get_axis("ui_left","ui_right")
	velocity.x =input_axis * move_speed

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Pinchos") or area.is_in_group("PinchoRojo"):
		die()

func die():
	is_dead = true
	death_sound.play()
	$AnimatedSprite2D.play("dead")
	Ui.vidas_caballero -= 1
	await get_tree().create_timer(0.5).timeout
	update_animations()
	respawn()

func respawn():
	global_position = respawn_point
	is_dead = false
	velocity = Vector2.ZERO
