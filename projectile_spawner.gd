extends Node

class_name BulletSpawner

const bullets = {
	
	"basic" : preload("res://basicBullet.tscn")
	
}

static func shoot(scene, bullet_name, pos, dir, speed, damage, knockback, lifetime):
	
	var bullet = bullets[bullet_name].instance()
	
	bullet.damage = damage
	bullet.vel = Vector2(speed, 0).rotated(dir)
	bullet.knockback = knockback
	bullet.global_position = pos
	
	bullet.lifetime = lifetime
	
	scene.add_child(bullet)
