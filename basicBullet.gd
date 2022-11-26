extends KinematicBody2D

var damage = 0
var vel = Vector2()
var knockback = 0
var lifetime = 0

func _ready():
	
	$LifeTimer.wait_time = lifetime
	$LifeTimer.start()
	
	$AnimationPlayer.playback_speed = 1 / lifetime

func _physics_process(delta):
	
	rotation = vel.angle()
	
	move_and_slide(vel)


func _on_hitbox_area_entered(area):
	
	var body = area.get_parent()
	
	if area.is_in_group("enemy_hurtbox"):
		
		if body.hp > 0:
		
			body.damage(
				
				damage,
				vel.angle(),
				knockback
				
			)
			
			die()
			
			ParticleManager.spawn_particles("basicBulletDie", global_position, rad2deg(vel.angle()))


func _on_hitbox_body_entered(body):
	
	if body.name != "player":
		
		die()
		
		ParticleManager.spawn_particles("basicBulletDie", global_position, rad2deg(vel.angle()))


func die():
	
	if is_queued_for_deletion(): return
	
	get_parent().add_child($Particles2D)
		
	var ParticleNode = get_node("Particles2D")
	
	ParticleNode.add_child(ParticleManager.KillTimer.instance())
		
	ParticleNode.emitting = false
		
	remove_child(ParticleNode)
		
	ParticleNode.global_position = global_position
		
	get_parent().add_child(ParticleNode)
		
	queue_free()
