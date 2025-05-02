extends Node

const SPAWN_POINTS := {
	#properchurch
	#"name":{"position": Vector2(0,0), "direction": "dir"}
	"exterior": {"position": Vector2(3000, 919), "direction": "down"},
	
	"narthex_down": {"position": Vector2(2996, -1472),"direction": "up"},
	"narthex_up": {"position": Vector2(3000, -1612), "direction": "down"},
	
	"sanctuary_down": {"position": Vector2(3000, -2515), "direction": "up"},
	"sanctuary_up_left": {"position": Vector2(2815, -3675), "direction": "down"},
	"sanctuary_up_right": {"position": Vector2(3185, -3675), "direction": "down"},
	
	"atrium_down_left": {"position": Vector2(2815, -4505), "direction": "up"},
	"atrium_down_right": {"position": Vector2(3183, -4505), "direction": "up"},
	"atrium_up_left": {"position": Vector2(2818,-4777), "direction": "down"},
	"atrium_up_right": {"position": Vector2(3189, -4775), "direction": "down"},
	
	#convent [first floor]
	"first_floor_left": {"position": Vector2(-177,-109), "direction": "up"},
	"first_floor_right": {"position": Vector2(242,-107), "direction": "up"},
	"first_floor_up": {"position": Vector2(32,-197), "direction": "up"},
	
	"kitchen_out": {"position": Vector2(-362, 80), "direction": "left"},
	"kitchen_right": {"position": Vector2(-1180, 78), "direction": "right"},
	"kitchen_up": {"position": Vector2(-1495, -110), "direction": "left"},
	
	"pantry_down": {"position": Vector2(-1490, -705), "direction": "right"},
	
	"boiler_out": {"position": Vector2(429, -128), "direction": "right"},
	"boiler_left": {"position": Vector2(-76, -1062), "direction": "left"},
	
	"rectory_out": {"position": Vector2(431, 203), "direction": "left"},
	"rectory_left": {"position": Vector2(1267, 211), "direction": "right"},
	"rectory_up": {"position": Vector2(1572,-56), "direction": "down"},
	
	"closet":{"position": Vector2(1572,-741), "direction": "up"},
	#convent [second floor]
	#"name":{"position": Vector2(0,0), "direction": "dir"}
	"second_floor_down":{"position": Vector2(36,-2610), "direction": "dir"},
	"second_floor_up":{"position": Vector2(36,-2696), "direction": "down"},
	
	"bathroom_out":{"position": Vector2(-337,-2645), "direction": "right"},
	"bathroom_right":{"position": Vector2(-950,-3746), "direction": "left"},
	
	"prayer_room_out":{"position": Vector2(-338,-2436), "direction": "right"},
	"prayer_room_right":{"position": Vector2(-1086,-2919), "direction": "left"},
	
	"storage_room_out":{"position": Vector2(-337,-2229), "direction": "right"},
	"storage_room_right":{"position": Vector2(-1173,-2224), "direction": "left"},
	"storage_room_left":{"position": Vector2(-1360,-2223), "direction": "right"},
	"storage_closet_right":{"position": Vector2(-2203,-2220), "direction": "left"},
	
	"vestry_out":{"position": Vector2(413,-2560), "direction": "left"},
	"vestry_left":{"position": Vector2(1175,-3004), "direction": "right"},
	
	"sacristy_out":{"position": Vector2(413,-2316), "direction": "left"},
	"sacristy_left":{"position": Vector2(1175,-2224), "direction": "right"},
	
	#convent [third floor]
	#"name":{"position": Vector2(0,0), "direction": "dir"}
	"third_floor_down":{"position": Vector2(37,-5107), "direction": "up"},
	
	"bathroom_out_2":{"position": Vector2(-338,-5145), "direction": "right"},
	"bathroom_right_2":{"position": Vector2(-1026,-5434), "direction": "left"},
	
	"dormitory_out":{"position": Vector2(-336,-4938), "direction": "right"},
	"dormitory_right":{"position": Vector2(-1834,-4974), "direction": "left"},
	
	"recreational_out":{"position": Vector2(-331, -4727), "direction": "right"},
	"recreational_right":{"position": Vector2(-1024,-4523), "direction": "left"},
	
	"storage_out_2":{"position": Vector2(411,-5064), "direction": "left"},
	"storage_left_2":{"position": Vector2(1100, -5428), "direction": "right"},
	
	"laundry_out":{"position": Vector2(416,-4816), "direction": "left"},
	"laundry_left":{"position": Vector2(1100,-4520), "direction": "right"}
	
	#convent [basement]
	#"name":{"position": Vector2(0,0), "direction": "dir"}
}

signal on_trigger_player_spawn(position: Vector2, direction: String)

func go_to_area(area_tag: String) -> void:
	var spawn_data = SPAWN_POINTS.get(area_tag)
	if spawn_data:
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
