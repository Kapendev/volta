tool
extends VBoxContainer

signal pressed(index)
export var button_count := 0 setget set_button_count

func _ready() -> void:
	if not Engine.editor_hint:
		for i in range(1, get_child_count()):
			var button := get_child(i)
			button.connect("pressed", self, "_on_pressed", [i - 1])

func _on_pressed(index: int) -> void:
	emit_signal("pressed", index)

func set_button_count(value: int) -> void:
	if value > 0:
		button_count = value
	else:
		button_count = 0
	
	if is_inside_tree():
		var delta := button_count - get_child_count() + 1
		if delta < 0:
			for i in range(delta * -1):
				get_child(get_child_count() - 1 - i).queue_free()
		elif delta > 0:
			for i in range(delta):
				var button := get_child(0).duplicate()
				add_child(button)
				if Engine.editor_hint:
					button.set_owner(get_tree().get_edited_scene_root())
				button.name = "Button"
				button.show()
