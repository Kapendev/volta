class_name TextEvent
extends Event

export(String, FILE, "*.txt") var path := ""

func react(_body: KinematicBody2D) -> void:
	var data := TextReader.read(path)
	if data:
		UI.show_textbox(data)
