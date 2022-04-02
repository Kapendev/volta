extends Node

const SCENE_DIR := "res://src/scenes/"

func print_error(node: Node, func_name: String, err: int) -> void:
	printerr("%s: %s -> error = %d" % [node.name, func_name, err])

func pause() -> void:
	get_tree().set_pause(true)

func unpause() -> void:
	var tree := get_tree()
	yield(tree.create_timer(0.01), "timeout")
	tree.set_pause(false)

func change_scene(scene: String) -> void:
	var err := get_tree().change_scene(SCENE_DIR + scene + ".tscn")
	if err:
		print_error(self, "change_scene", err)

func get_current_scene() -> Node:
	return get_tree().get_current_scene()
