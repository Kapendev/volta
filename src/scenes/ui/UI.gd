extends CanvasLayer

# NOTE: signal for textbox? textbox_ended?

enum States {NOTHING, TEXTBOX}

signal menu_pressed(index)

const UIBUTTON_RES := preload("UIButton.tscn")

var counter := 0
var state := 0
var state_args: PoolStringArray
onready var menu := $UIMenu
onready var textbox := $UITextbox

func _ready() -> void:
	set_process(false)
	textbox.hide()

func _input(event: InputEvent) -> void:
	match state:
		States.TEXTBOX:
			if event.is_action_pressed("ui_accept") \
			and get_textbox_label().get_percent_visible() == 1:
				counter += 1
				if counter < len(state_args):
					show_textbox(state_args[counter])
				else:
					Game.unpause()
					set_process_input(false)
					hide_textbox()
					counter = 0

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
	return textbox.get_node("Panel/Label") as RichTextLabel

func show_textbox(text: String) -> void:
	textbox.show()
	get_textbox_label().set_bbcode("\n" + text)

func show_input_textbox(text_array: PoolStringArray) -> void:
	if text_array:
		Game.pause()
		set_process_input(true)
		show_textbox(text_array[0])
		state = States.TEXTBOX
		state_args = text_array

func append_textbox(text: String) -> void:
	get_textbox_label().append_bbcode(text)

func hide_textbox() -> void:
	textbox.hide()
