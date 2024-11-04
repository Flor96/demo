extends Node

@export var move_speed : float
@export var shoot_cooldown : float

@onready var point = $Marker2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var explotion_sound = $Explotion
@onready var shoot_sound = $Shoot

var is_facing_right = true
var can_shoot = true
var is_dead = false

func _physics_process(_delta):
	if is_dead:
		return
	move()
	update_animation()

	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()
		$Shoot.play()

func update_animation():
	if velocity.x
		$AnimatedSprite2D.play("move")
	else:
		$AnimatedSprite2D.play("idle")

func move():
	if velocity.length():
		velocity = velocity.normalized() * move_speed

func shoot():
	can_shoot = false
	var projectile = projectile_scene.instantiate()
	projectile.position = point.global_position
	projectile.rotation = rotation
	get_parent().add_child(projectile)

	await get_tree().create_timer(shoot_cooldown).timeout
	can_shoot = true

func _on_area_2d_area_entered(area):
	if area.is_in_group("Enemy_Spaceship") or area.is_in_group("Meteorite") or area.is_in_group("Enemy_Zigzag") or area.is_in_group("Boss") or area.is_in_group("bullet"):
		trigger_explosion()

func trigger_explosion():
	if is_dead:
		return

	is_dead = true
	explotion_sound.play()
	animated_sprite.play("explotion")

	await animated_sprite.animation_finished

	game_over.visible = true
	get_tree().paused = true
