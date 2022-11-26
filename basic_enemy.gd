extends KinematicBody2D

var vel = Vector2()

var knockback = Vector2()

var hp = 50

func _process(delta):
	
	knockback = lerp(knockback, Vector2(), delta * 5)
	
	vel = lerp(vel, global_position.direction_to(Globals.player_pos).normalized() * 80, delta * 10)
	
	move_and_slide(vel + knockback)

func damage(dmg, dir, kb):
	
	hp -= dmg
	
	knockback = Vector2(kb, 0).rotated(dir)
	
	if hp <= 0:
		
		queue_free()
		
		get_parent().spawn_drops(global_position, rand_range(2, 3))
