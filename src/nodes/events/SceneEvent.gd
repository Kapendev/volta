class_name SceneEvent
extends Event

export var scene := ""
export var target_position := Vector2()
export var target_direction := Vector2()

func react(body: KinematicBody2D) -> void:
	if scene:
		Game.change_scene(scene)
		body.set_position(target_position)
		if target_direction:
			body.last_move_direction = target_direction
