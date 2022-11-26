extends Sprite

var picked_up = false

var speed = 0

func _process(delta):
	
	if picked_up:
		
		speed = lerp(speed, 400, delta * 5)
		
		global_position += global_position.direction_to(Globals.player_pos).normalized() * speed * delta
		
		if Globals.player_pos.distance_to(global_position) < 8:
			
			queue_free()
		
		return
	
	if Globals.player_pos.distance_to(global_position) < 50:
	
		picked_up = true
		
		$AnimationPlayer.play("pickup")
