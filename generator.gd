extends StaticBody2D

var stress = 0
var broken = false

func _process(delta):
	
	stress += delta
	
	if stress > 50 and !broken:
		
		var anim = (stress - 50) / 50
		
		$generator.scale.x = 1 + sin(stress * 4) * anim * 0.25
		$generator.scale.y = 1 - sin(stress * 4) * anim * 0.25
		
		$Particles2D.modulate.a = anim
		
		$Particles2D.emitting = true
		
		if stress > 100:
			
			$Camera2D.shake(18, 50, 0.15)
			
			$AnimationStarter.start()
			
			broken = true
			
			$Camera2D.global_position = Globals.player.get_node("Camera").global_position
			
			$Tween.interpolate_property(
				$Camera2D,
				"global_position",
				$Camera2D.global_position,
				Vector2(0, -15),
				1.5,
				Tween.TRANS_CUBIC,
				Tween.EASE_IN_OUT
			)
			
			$Tween.start()
			
			$Camera2D.current = true
		
	else:
		
		$Particles2D.emitting = false
		
		$Particles2D.modulate.a = 0


func _on_AnimationStarter_timeout():
	
	$AnimationPlayer.play("explode")
