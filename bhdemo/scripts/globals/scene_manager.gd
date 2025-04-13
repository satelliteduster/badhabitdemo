extends Node

#const MAIN_SCENE := preload("res://0_properchurch_rooms/properchurch.tscn")

const SPAWN_POINTS := {
	"exterior": {
		"position": Vector2(3000, 919),
		"direction": "down"
	},
	"narthex_down": {
		"position": Vector2(2996, -1472),
		"direction": "up"
	},
	"narthex_up": {
		"position": Vector2(3000, -1612),
		"direction": "down"
	},
	"sanctuary_down": {
		"position": Vector2(3000, -2515),
		"direction": "up"
	},
	"sanctuary_up_left": {
		"position": Vector2(2815, -3675),
		"direction": "down"
	},
	"sanctuary_up_right": {
		"position": Vector2(3185, -3675),
		"direction": "down"
	},
	"atrium_down_left": {
		"position": Vector2(2815, -4505),
		"direction": "up"
	},
	"atrium_down_right": {
		"position": Vector2(3183, -4505),
		"direction": "up"
	}
}

signal on_trigger_player_spawn(position: Vector2, direction: String)

func go_to_area(area_tag: String) -> void:
	var spawn_data = SPAWN_POINTS.get(area_tag)
	if spawn_data:
		#if get_tree().currentscene.name != "properchurch":
			#get_tree().change_scene_to_packed.call_deferred(MAIN_SCENE)
		
		# Trigger the player spawn after scene load
		call_deferred("trigger_player_spawn", spawn_data.position, spawn_data.direction)

func trigger_player_spawn(position: Vector2, direction: String) -> void:
	on_trigger_player_spawn.emit(position, direction)

#code above for rooms; code below for scenes

#const SCENES := {
	#"exterior": preload("res://0_properchurch_rooms/exterior.tscn"),
	#"narthex": preload("res://0_properchurch_rooms/narthex.tscn"),
	#"sanctuary": preload("res://0_properchurch_rooms/sanctuary.tscn"),
	#"atrium": preload("res://0_properchurch_rooms/atrium.tscn")
#}
#
#signal on_trigger_player_spawn(position: Vector2, direction: String)
#
#func go_to_scene(scene_tag, destination_tag):
	#var scene_to_load = SCENES.get(scene_tag)
	#
	#match SCENES: #match scene_tag:
		#"exterior":
			#scene_to_load = SCENES.exterior
		#"narthex":
			#scene_to_load = SCENES.narthex
		#"sanctuary":
			#scene_to_load = SCENES.sanctuary
		#"atrium":
			#scene_to_load = SCENES.atrium
	#
	#if scene_to_load != null:
		#get_tree().change_scene_to_packed.call_deferred(scene_to_load)
#
#func trigger_player_spawn(position: Vector2, direction: String) -> void:
	#print("player pos:")
	#print(position)
	#print("player direction:" + direction)
	#on_trigger_player_spawn.emit(position, direction)
