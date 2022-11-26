extends KinematicBody2D

var vel = Vector2()

func _process(delta):
	
	vel = lerp(vel, global_position.direction_to(Globals.player_pos).normalized() * 80, delta * 10)
	
	move_and_slide(vel)
