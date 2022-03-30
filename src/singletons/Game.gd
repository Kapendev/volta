extends Node

const SCENE_DIR = "res://src/scenes/"

var ui := UI.new()

func _ready():
	add_child(ui)

func change_scene(scene: String) -> void:
	get_tree().change_scene(SCENE_DIR + scene + ".tscn")

func get_current_scene() -> Node:
	return get_tree().get_current_scene()
