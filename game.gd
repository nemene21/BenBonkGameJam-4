extends YSort

const radium = preload("res://pickup.tscn")

func spawn_drops(pos, points):
	
	for i in points:
		
		var pickup = radium.instance()
		
		pickup.global_position = pos
		pickup.vel = Vector2(rand_range(-50, 50), rand_range(-50, 50))
		
		add_child(pickup)
