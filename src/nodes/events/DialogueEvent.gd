class_name DialogueEvent
extends Event

export(String, FILE, "*.json") var path := ""

func _ready() -> void:
	var err := UI.textbox.connect("deactivated", self, "_on_textbox_deactivated")
	if err:
		Error.echo(name, "UI.textbox.connect", err)

func _on_textbox_deactivated() -> void:
	Game.unpause()

func react(_body: KinematicBody2D) -> void:
	var file := File.new()
	var err := file.open(path, File.READ)
	if err:
		Error.echo(name, "file.open", err)
	else:
		# A hacked thing to test a json file.
		var json := JSON.parse(file.get_as_text())
		var data := PoolStringArray()
		for record in json.result[Game.current_language][0]:
			data.append(record["text"])
		file.close()
		Game.pause()
		UI.textbox.activate(data)
