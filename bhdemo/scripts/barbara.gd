extends CharacterBody2D

class_name Player

@export var speed = 150
@onready var walking = $AnimatedSprite2D

@onready var interactions = []
@onready var interaction = $interaction
@onready var interactlabel = $interaction/text

@onready var interactresponse = $interaction/response

var lastdir = "down"

func _ready():
	SceneManager.on_trigger_player_spawn.connect(_on_spawn)
	interaction.hide()
	_update_interactions()
	pass

func _on_spawn(position: Vector2, direction: String):
	visible = true # reset visibility
	velocity = Vector2.ZERO  # reset velocity
	set_deferred("global_position", position) #set position based on entrance
	lastdir = direction #set direction based on entrance

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
	
	if Input.is_action_just_pressed("interact"):
		execute_interactions()

#re:interaction v

func _on_int_area_area_entered(area: Area2D) -> void:
	if area is Interactive:
		interaction.show()
		interactresponse.hide()
		interactions.insert(0, area)
		_update_interactions()

func _on_int_area_area_exited(area: Area2D) -> void:
	if area is Interactive:
		interaction.hide()
		if interactresponse:
			interactresponse.hide()
		interactions.erase(area)
		_update_interactions()

func _update_interactions():
	if interactions:
		interactlabel.text = interactions[0].interact_label
	else:
		interactlabel.text = ""

func execute_interactions():
	if interactions:
		var current_int = interactions[0]
		match current_int.interact_type:
			"print_text" : 
				interactresponse.show()
				interactresponse.text = current_int.interact_value
				print(current_int.interact_value)
			"collectible" : 
				#get_parent().current_int.hide()
				#InventoryManager._add_to_inventory(current_int)
				print(current_int.interact_value)
