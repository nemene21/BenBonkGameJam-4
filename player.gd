extends KinematicBody2D

var vel = Vector2()

var slide = 0.125

var speed = 125

var anim_timer = 0

func _ready():
	pass # Replace with function body.


func _process(delta):
	
	# Movement
	
	var input = Vector2(
		
		int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")),
		int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
		
	)
	
	vel = lerp(vel, input.normalized() * speed, 1 / slide * delta)
	
	move_and_slide(vel)
	
	Globals.player_pos = global_position
	
	# Animation
	
	anim_timer += delta
	
	$Particles2D.emitting = input.length() > 0
	
	$SpritePivot/Sprite.flip_h = get_local_mouse_position().x < 0
	
	if vel.length() > speed * 0.25:
		
		$AnimationPlayer.play("walk")
		
	else:
		
		$AnimationPlayer.play("idle")
	
	# Camera movement
	
	var mouse_position = get_local_mouse_position() * 0.25
	
	$Camera.position = lerp($Camera.position, mouse_position, delta * 12)
