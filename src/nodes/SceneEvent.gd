class_name SceneEvent
extends Event

export var scene := ""

func react() -> void:
	if scene:
		Game.change_scene(scene)
