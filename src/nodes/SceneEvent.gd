class_name SceneEvent
extends Event

export var scene := ""
export var target_position := Vector2()

func react(body: KinematicBody2D) -> void:
	if scene:
		Game.change_scene(scene)
		body.set_position(target_position)
