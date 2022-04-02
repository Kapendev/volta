class_name TextEvent
extends Event

export var text_array := PoolStringArray()

func react(_body: KinematicBody2D) -> void:
	UI.show_textbox(text_array)
