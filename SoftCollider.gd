extends Area2D

func _process(delta):
	
	var areas = get_overlapping_areas()
	
	for area in areas:
		
		var push : Vector2 = area.global_position.direction_to(global_position).normalized()
		
		push.x *= 25
		push.y *= 25
		
		get_parent().move_and_slide(push)
