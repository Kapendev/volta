class_name DialogueEvent
extends Event

const text_reader = preload("res://src/references/TextReader.gd")
export(String, FILE, "*.txt") var path := ""

func _ready() -> void:
	var err := UI.textbox.connect("deactivated", self, "_on_textbox_deactivated")
	if err:
		Game.print_error(self, "UI.textbox.connect", err)

func _on_textbox_deactivated() -> void:
	Game.unpause()

func react(_body: KinematicBody2D) -> void:
	var data := text_reader.read(path)
	if data:
		UI.textbox.activate(data)
		Game.pause()
