class_name UI
extends CanvasLayer

signal menu_pressed(index)

var screen := Control.new()
var menu := VBoxContainer.new()
var dialogue := VBoxContainer.new()

func _ready():
	# Not sure how to fix the size...
	add_child(screen)
	screen.add_child(menu)
	screen.add_child(dialogue)
	screen.set_anchors_preset(Control.PRESET_WIDE)
	menu.set_anchors_preset(Control.PRESET_WIDE)
	menu.alignment = BoxContainer.ALIGN_CENTER
	dialogue.set_anchors_preset(Control.PRESET_WIDE)

func _on_menu_button_pressed(index: int) -> void:
	emit_signal("menu_pressed", index)

func show_menu(words: PoolStringArray) -> void:
	for i in range(len(words)):
		var button := Button.new()
		button.text = words[i]
		button.connect("pressed", self, "_on_menu_button_pressed", [i])
		menu.add_child(button)
		if i == 0:
			button.grab_focus()

func hide_menu() -> void:
	for button in menu.get_children():
		button.queue_free()

