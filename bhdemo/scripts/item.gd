class_name Interactive extends Area2D

@export var interact_label = "none"
@export var interact_type = "none"
@export var interact_value = "none"

func _ready():
	body_entered.connect(_on_area_entered)

func _on_area_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("click button")
