extends Node

const SCENE_PATHS = {
	"properchurch": "res://properchurch.tscn",
	"convent": "res://convent.tscn",
	"basement": "res://basement.tscn"
}

var current_scene: Node2D
var current_room: Area2D
var barbara: CharacterBody2D = null

func transition_to():
	pass
#starting from scratch
