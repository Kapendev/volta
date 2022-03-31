extends CanvasLayer

signal menu_pressed(index)

const UIBUTTON_RES := preload("UIButton.tscn")
const UIMENU_RES := preload("UIMenu.tscn")
const UITEXTBOX_RES := preload("UITextbox.tscn")

var menu := UIMENU_RES.instance()
var textbox := UITEXTBOX_RES.instance()

func _ready() -> void:
	add_child(menu)
	add_child(textbox)
	textbox.hide()

func _on_menu_button_pressed(index: int) -> void:
	emit_signal("menu_pressed", index)

func show_menu(words: PoolStringArray) -> void:
	for i in range(len(words)):
		var button := UIBUTTON_RES.instance()
		button.set_text(words[i])
		button.connect("pressed", self, "_on_menu_button_pressed", [i])
		menu.add_child(button)
		if i == 0:
			button.grab_focus()

func hide_menu() -> void:
	for button in menu.get_children():
		button.queue_free()

func get_textbox_label() -> RichTextLabel:
	return textbox.get_child(0) as RichTextLabel

func show_textbox(text: String) -> void:
	textbox.show()
	get_textbox_label().set_bbcode("\n" + text)

func append_textbox(text: String) -> void:
	get_textbox_label().append_bbcode(text)

func hide_textbox() -> void:
	textbox.hide()
