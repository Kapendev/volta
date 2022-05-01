extends Node

const SCENE_DIR := "res://src/scenes/"
const LANGUAGES := PoolStringArray([
	"En", "Gr"
])

var current_language := LANGUAGES[0]

func pause() -> void:
	get_tree().set_pause(true)

func unpause() -> void:
	get_tree().set_pause(false)

func change_scene(scene: String) -> void:
	var err := get_tree().change_scene(SCENE_DIR + scene + ".tscn")
	if err:
		Error.echo(name, "get_tree().change_scene", err)

func get_current_scene() -> Node:
	return get_tree().get_current_scene()
