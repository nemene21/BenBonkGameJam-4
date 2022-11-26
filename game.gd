extends YSort

const radium = preload("res://pickup.tscn")

func _ready():
	
	ParticleManager.set_target(self)

func spawn_drops(pos, points):
	
	for i in points:
		
		var pickup = radium.instance()
		
		pickup.global_position = Vector2(pos.x, pos.y)
		pickup.vel = Vector2(rand_range(-80, 80), rand_range(-80, 80))
		
		add_child(pickup)
