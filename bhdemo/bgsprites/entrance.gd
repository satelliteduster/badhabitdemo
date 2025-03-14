extends Area2D
#reusable entrance script to allow passage from one scene to another

@export var target_scene: String = ""
@export var target_pos = Vector2()

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: CharacterBody2D):
	if body.name == "barbara":
		var scene_manager = get_node("/root/bhdemo/scene_manager")
		
		if scene_manager:
			scene_manager.call_deferred("transition_to", target_scene, body, target_pos)
		else:
			push_error("scene manager missing/invalid!")
