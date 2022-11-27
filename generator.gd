extends StaticBody2D

var stress = 50

func _process(delta):
	
	stress += delta
	
	if stress > 50:
		
		var anim = (stress - 50) / 50
		
		$generator.scale.x = 1 + sin(stress * 4) * anim * 0.25
		$generator.scale.y = 1 - sin(stress * 4) * anim * 0.25
		
		$Particles2D.modulate.a = anim
		
		$Particles2D.emitting = true
		
	else:
		
		$Particles2D.emitting = false
		
		$Particles2D.modulate.a = 0
