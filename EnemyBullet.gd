extends KinematicBody2D

var vel = Vector2()

var anim = 0

func _process(delta):
	
	move_and_slide(vel)
	
	anim += delta * 5
	
	$Sprite.modulate.r = 2 + sin(anim)
	$Sprite.modulate.g = 2 + sin(anim)
	$Sprite.modulate.b = 2 + sin(anim)

func _on_Area2D_area_entered(area):
	if area.get_parent().name == "player":
		
		area.get_parent().hurt()
		
		queue_free()


func _on_Area2D_body_entered(body):
	queue_free()
