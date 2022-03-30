extends Control

signal menu_pressed(index)

const UIBUTTON_RES := preload("res://src/scenes/ui/UIButton.tscn")
const UIMENU_RES := preload("res://src/scenes/ui/UIMenu.tscn")

var menu := UIMENU_RES.instance()

func _ready() -> void:
	add_child(menu)

func _on_menu_button_pressed(index: int) -> void:
	emit_signal("menu_pressed", index)

func show_menu(words: PoolStringArray) -> void:
	for i in range(len(words)):
		var button := UIBUTTON_RES.instance()
		button.text = words[i]
		button.connect("pressed", self, "_on_menu_button_pressed", [i])
		menu.add_child(button)
		if i == 0:
			button.grab_focus()

func hide_menu() -> void:
	for button in menu.get_children():
		button.queue_free()
