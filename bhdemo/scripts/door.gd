extends Area2D

class_name door
@onready var spawn = $spawn

@export var destination_room: String

func _ready():
	body_entered.connect(_on_door_entered)

func _on_door_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		#print("awawa")
		SceneManager.go_to_area(destination_room)
