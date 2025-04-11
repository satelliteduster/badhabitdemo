extends Node

const scene_outside = preload("res://0_properchurch_rooms/outside.tscn")
const scene_narthex = preload("res://0_properchurch_rooms/narthex.tscn")
const scene_sanctuary = preload("res://0_properchurch_rooms/sanctuary.tscn")
const scene_atrium = preload("res://0_properchurch_rooms/atrium.tscn")

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_scene(scene_tag, destination_tag):
	var scene_to_load
	
	match scene_tag:
		"outside":
			scene_to_load = scene_outside
		"narthex":
			scene_to_load = scene_narthex
		"sanctuary":
			scene_to_load = scene_sanctuary
		"atrium":
			scene_to_load = scene_atrium
			
	if scene_to_load != null:
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)

func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)
