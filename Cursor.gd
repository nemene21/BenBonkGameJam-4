extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _process(delta):
	
	global_position = get_global_mouse_position()
	
	rotation_degrees = 90 * Globals.player_weapon_reload_anim
	
	scale.x = 1 + Globals.player_weapon_reload_anim * 0.5
	scale.y = 1 + Globals.player_weapon_reload_anim * 0.5
