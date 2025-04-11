extends Node

func _ready():
	if SceneManager.spawn_door_tag != null:
		_on_level_spawn(SceneManager.spawn_door_tag)
	
func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var doorvar = get_node(door_path) as door
	SceneManager.trigger_player_spawn(doorvar.spawn.global_position, doorvar.spawn_direction)
