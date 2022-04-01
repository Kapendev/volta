class_name TextEvent
extends Event

export var text_array := PoolStringArray()

func react() -> void:
	Game.show_textbox(text_array)
