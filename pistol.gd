extends Node2D

export var damage = 10
export var bullets_ps = 2
export var knockback = 100
export var speed = 500
export var bullet_lifetime = 0.1

export var spread = 8

export(bool) var automatic = false

var reloaded = false

func _ready():
	
	$reload_timer.set_wait_time(1.0 / bullets_ps)
	$reload_timer.start()

func _process(delta):
	
	if ((Input.is_action_just_pressed("shoot") and !automatic) or (Input.is_action_pressed("shoot") and automatic)) and reloaded:
		
		var direction = (get_global_mouse_position() - get_parent().global_position).angle()
		
		get_parent().get_node("Camera").shake(4, 1, 0.15, 180 - rad2deg(direction))
		
		BulletSpawner.shoot(
			
			get_parent().get_parent(),
			"basic",
			$pistol/barrel.global_position,
			direction + deg2rad(rand_range(-spread, spread)),
			speed,
			damage,
			knockback,
			bullet_lifetime
			
		)
		
		$AnimationPlayer.play("shoot")
		
		reloaded = false
		
		$reload_timer.start()
	
	rotation = (get_global_mouse_position() - get_parent().global_position).angle()
	
	show_behind_parent = rotation < 0
	
	$pistol.flip_v = abs(rotation_degrees) > 45

func _on_reload_timer_timeout():
	reloaded = true
