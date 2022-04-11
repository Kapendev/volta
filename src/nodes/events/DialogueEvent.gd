class_name DialogueEvent
extends Event

export(String, FILE, "*.txt") var path := ""

func _ready() -> void:
	var err := UI.textbox.connect("deactivated", self, "_on_textbox_deactivated")
	if err:
		Error.echo(name, "UI.textbox.connect", err)

func _on_textbox_deactivated() -> void:
	Game.unpause()

func react(_body: KinematicBody2D) -> void:
	var data := DialogueReader.read(path)
	if data:
		Game.pause()
		UI.textbox.activate(data)
