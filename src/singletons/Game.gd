extends Node

const SCENE_DIR := "res://src/scenes/"
const UI_RES := preload("res://src/scenes/ui/UI.tscn")

var ui := UI_RES.instance()

func _ready() -> void:
	set_pause_mode(Node.PAUSE_MODE_PROCESS)
	add_child(ui)

func pause() -> void:
	get_tree().set_pause(true)

func unpause() -> void:
	var tree := get_tree()
	yield(tree.create_timer(0.01), "timeout")
	tree.set_pause(false)

func change_scene(scene: String) -> void:
	get_tree().change_scene(SCENE_DIR + scene + ".tscn")

func get_current_scene() -> Node:
	return get_tree().get_current_scene()
