extends Node

@onready var proper_church = $currentscene/properchurch
@onready var convent = $currentscene/convent
@onready var barbara = $barbara

func _ready():
	#convent.hide() #hide convent floors on loading
	#for child in convent.get_children():
		#if child is CollisionShape2D or child is CollisionPolygon2D:
			#child.set_deferred("disabled", true)
	pass

func _on_door_entered(body):
	if body == barbara:
		_scene_transition()
	
func _scene_transition():
	barbara.visible = true
	barbara._on_spawn() # put barb in the new scene
