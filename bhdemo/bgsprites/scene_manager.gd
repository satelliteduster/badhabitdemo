extends Node

const SCENE_PATHS = {
	"exterior": "res://exterior.tscn",
	"narthex": "res://narthex.tscn",
	"sanctuary": "res://sanctuary.tscn",
	"atrium": "res://atrium/tscn"
}

var current_location: Node2D
var barbara: CharacterBody2D = null

func transition_to(scene_key: String, player: CharacterBody2D, _target_position: Vector2): # shift to the proper scene
	if not SCENE_PATHS.has(scene_key):
		push_error("Invalid scene key: ", scene_key)
		return
	barbara = player # set barb as the player variable
	var container = get_node_or_null("/root/bhdemo/currentscene")
	
	if !container:
		push_error("Missing scene container!")
		return
		
	# clear previous scene
	if current_location:
		current_location.queue_free()
		await current_location.tree_exited
		
	# Load new scene
	var new_scene = load(SCENE_PATHS.get(scene_key, ""))
	if !new_scene:
		push_error("Invalid scene key: ", scene_key)
		return
	
	current_location = new_scene.instantiate()
	container.add_child(current_location)
	call_deferred("_reset_barbara")

func _reset_barbara(): # troubleshooter i
	if !barbara || !is_instance_valid(barbara):
		push_error("Invalid character reference")
		return
	# single reset call with proper deferral
	barbara.call_deferred("reset_for_new_scene")
	barbara.set_deferred("global_position", Vector2(576, 536)) #< want to change this to target position
	# changing position based on scene parameters

func _reset_barbara_physics(): # troubleshooter ii
	if barbara and is_instance_valid(barbara):
		barbara.reset_for_new_scene()
	else:
		push_error("Barbara is not valid!")
