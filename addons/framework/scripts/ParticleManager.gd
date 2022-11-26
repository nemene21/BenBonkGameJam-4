extends Node

var particleSystems = {}

const KillTimer = preload("res://addons/framework/usefulNodes/KillTimer.tscn")

var target = self

func add_particlesystem(name, path):
	particleSystems[name] = load(path)

func set_target(newTarget):
	
	target = newTarget

func spawn_particles(system, pos = Vector2(), rot = 0, lifetime = 5):
	
	var particleNode = particleSystems[system].instance()
	
	particleNode.global_position = pos
	particleNode.rotation_degrees = rot
	
	if particleNode is Particles2D: particleNode.emitting = true
	
	var timer = KillTimer.instance()
	timer.wait_time = lifetime
	
	particleNode.add_child(timer)
	
	target.add_child(particleNode)

func _ready():
	
	add_particlesystem("basicBulletDie", "res://bulletDie.tscn")
	add_particlesystem("muzzleFlash", "res://muzzleFlash.tscn")
	
	add_particlesystem("textParticle", "res://textParticle.tscn")
