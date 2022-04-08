extends VBoxContainer

signal activated()
signal deactivated(index)

const UIBUTTON_RES := preload("res://src/scenes/ui/UIButton.tscn")

func _ready() -> void:
	show()

func activate(new_args: PoolStringArray, new_alignment := BoxContainer.ALIGN_CENTER) -> void:
	show()
	for i in range(len(new_args)):
		var button := UIBUTTON_RES.instance()
		var err := button.connect("pressed", self, "deactivate", [i])
		if err:
			Game.print_error(self, "button.connect", err)
		else:
			button.set_text(new_args[i])
			add_child(button)
			alignment = new_alignment
			if i == 0:
				button.grab_focus()
		emit_signal("activated")

func deactivate(index: int) -> void:
	for node in get_children():
		node.queue_free()
	hide()
	emit_signal("deactivated", index)
