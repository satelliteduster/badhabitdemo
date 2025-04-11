extends CharacterBody2D

class_name Player

@export var speed = 150
@onready var walking = $AnimatedSprite2D

var lastdir = "down"

func _ready():
	SceneManager.on_trigger_player_spawn.connect(_on_spawn)
	

func _on_spawn(position: Vector2, direction: String):
	global_position = position
	lastdir = direction

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector * speed
		
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				walking.play("right")
				lastdir = "right"
			else:
				walking.play("left")
				lastdir = "left"
		else:
			if input_vector.y > 0:
				walking.play("down")
				lastdir = "down"
			else:
				walking.play("up")
				lastdir = "up"
	else:
		velocity = Vector2.ZERO
		walking.play(lastdir + "idle")
	
	move_and_slide()
