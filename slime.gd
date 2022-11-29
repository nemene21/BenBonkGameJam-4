extends KinematicBody2D

var vel = Vector2()

var knockback = Vector2()

var hp = 50

const bullet = preload("res://EnemyBullet.tscn")

func _ready():
	
	$Timer.wait_time = rand_range(3, 4)
	$Timer.start()

func _process(delta):
	
	if (global_position - Globals.player_pos).length() > 200:
		
		return
		
	
	knockback = lerp(knockback, Vector2(), delta * 5)
	
	rotation = knockback.x * 0.005
	
	move_and_slide(vel + knockback)
	
	$Sprite.flip_h = vel.x < 0

func damage(dmg, dir, kb):
	
	hp -= dmg
	
	knockback = Vector2(kb, 0).rotated(dir)
	
	if hp <= 0:
		
		queue_free()
		
		get_parent().spawn_drops(global_position, rand_range(2, 3))
		
	$Sprite.material.set_shader_param("flash", 1)
	$Flash.start()

func _on_Flash_timeout():
	$Sprite.material.set_shader_param("flash", 0)


func _on_AnimationPlayer_animation_finished(anim_name):
	
	if anim_name == "jumpStart":
		
		$AnimationPlayer.play("jump")
		
		vel = Vector2(rand_range(-50, 50), rand_range(-50, 50))
		
	else:

		$AnimationPlayer.play("idle")

func shoot():
	
	vel = Vector2()
	
	var bSpeed = 50
	
	var bullet1 = bullet.instance()
	bullet1.vel = Vector2(bSpeed, 0)
	
	bullet1.global_position = global_position
	
	get_parent().add_child(bullet1)
	
	var bullet2 = bullet.instance()
	bullet2.vel = Vector2(-bSpeed, 0)
	
	bullet2.global_position = global_position
	
	get_parent().add_child(bullet2)
	
	var bullet3 = bullet.instance()
	bullet3.vel = Vector2(0, bSpeed)
	
	bullet3.global_position = global_position
	
	get_parent().add_child(bullet3)
	
	var bullet4 = bullet.instance()
	bullet4.vel = Vector2(0, -bSpeed)
	
	bullet4.global_position = global_position
	
	get_parent().add_child(bullet4)

func _on_Timer_timeout():
	
	$Timer.wait_time = rand_range(4, 6)
	$Timer.start()
	
	$AnimationPlayer.play("jumpStart")
