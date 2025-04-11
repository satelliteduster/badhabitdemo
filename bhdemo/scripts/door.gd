extends Area2D

class_name door

@export var destination_room: String
@export var destination_tag: String
@export var spawn_direction = "up"

@onready var spawn = $spawn

func _on_body_entered(body) -> void:
	if body is Player:
		print("awawa")
		SceneManager.go_to_scene(destination_room, destination_tag)
