extends Node
class_name Level

func _ready():
		pass
	
func _handle_player_spawn(destination_tag: String):
	#var door_path = "Doors/Door_" + destination_tag
	var doorvar = get_node(destination_tag) as door
	SceneManager.trigger_player_spawn(doorvar.spawn.global_position, doorvar.spawn_direction)
