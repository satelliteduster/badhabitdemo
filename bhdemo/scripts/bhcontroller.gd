extends Node

@onready var proper_church = $currentscene/properchurch
@onready var convent = $currentscene/convent
@onready var barbara = $barbara

func _ready():
	#process_mode = Node.PROCESS_MODE_PAUSABLE
	
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

#re:pausing game v

#func _pause_game():
	#if Input.is_action_just_pressed("pause"):
		#print("game paused.")
		#get_tree().paused = true
		#if Input.is_action_just_pressed("pause"):
			#print("game unpaused.")
			#get_tree().paused = false
	#else:
		#pass
