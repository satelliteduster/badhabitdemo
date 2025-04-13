extends Node
#added to maintain character consistency throughout scenes
var player_scene = preload("res://barbara.tscn")
var player_instance: Node2D = null
var current_area: String = ""

#var health: int = 1
#var inventory: Array = []

func spawn_player(position: Vector2, direction: String) -> void:
	if player_instance:
		player_instance.global_position = position
		player_instance.set_facing_direction(direction)
	else:
		player_instance = player_scene.instantiate()
		player_instance.global_position = position
		player_instance.set_facing_direction(direction)
		get_tree().root.add_child(player_instance)

func move_player_to_area(area_tag: String) -> void:
	if SceneManager.SPAWN_POINTS.has(area_tag):
		var spawn_data = SceneManager.SPAWN_POINTS[area_tag]
		spawn_player(spawn_data.position, spawn_data.direction)
