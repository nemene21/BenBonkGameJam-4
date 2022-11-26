extends Sprite

var picked_up = false

var speed = 0

var vel = Vector2()

func _ready():
	
	frame = rand_range(0, 2)

func _process(delta):
	
	vel = lerp(vel, Vector2(), delta * 5)
	
	global_position += vel * delta
	
	if picked_up:
		
		speed = lerp(speed, 400, delta * 5)
		
		global_position += global_position.direction_to(Globals.player_pos).normalized() * speed * delta
		
		if Globals.player_pos.distance_to(global_position) < 8:
			
			queue_free()
		
		return
	
	if Globals.player_pos.distance_to(global_position) < 40:
	
		picked_up = true
		
		$AnimationPlayer.play("pickup")


func _on_AnimationPlayer_animation_finished(anim_name):
	
	if !$AnimationPlayer.is_playing():
		
		$AnimationPlayer.play("idle")
