extends KinematicBody2D

var damage = 0
var vel = Vector2()
var knockback = 0

func _physics_process(delta):
	
	rotation = vel.angle()
	
	move_and_slide(vel)
