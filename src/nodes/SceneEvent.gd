class_name SceneEvent
extends Event

export var scene := ""

func react() -> void:
	if scene:
		Game.show_rect(0.5)
		Game.change_scene(scene)
