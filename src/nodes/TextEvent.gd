class_name TextEvent
extends Event

export var text_array := PoolStringArray()

func react() -> void:
	Game.ui.show_input_textbox(text_array)
