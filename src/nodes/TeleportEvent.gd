class_name TeleportEvent
extends Event

export var target_position := Vector2()

func react(body: KinematicBody2D) -> void:
	body.set_position(target_position)
