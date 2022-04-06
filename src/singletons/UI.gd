extends Node

signal menu_pressed(index)
signal textbox_hidden()

enum States {NOTHING, MENU, TEXTBOX}

const UIBUTTON_RES := preload("res://src/scenes/ui/UIButton.tscn")
const UIMENU_RES := preload("res://src/scenes/ui/UIMenu.tscn")
const UITEXTBOX_RES := preload("res://src/scenes/ui/UITextbox.tscn")

var count := 0
var state := 0
var state_args: PoolStringArray

var canvas := CanvasLayer.new()
var menu: VBoxContainer = UIMENU_RES.instance()
var textbox: VBoxContainer = UITEXTBOX_RES.instance()

var textbox_speed := 26
var textbox_label: RichTextLabel

func _ready() -> void:
	add_child(canvas)
	canvas.add_child(menu)
	canvas.add_child(textbox)
	textbox_label = textbox.get_node("Panel/Label")
	set_state(States.NOTHING)
	set_pause_mode(Node.PAUSE_MODE_PROCESS)

func _process(delta: float) -> void:
	match state:
		States.TEXTBOX:
			_state_textbox(delta)

func _state_textbox(delta: float) -> void:
	var total_char_count := textbox_label.get_total_character_count()
	var percent_visible := textbox_label.get_percent_visible()
	if Input.is_action_just_pressed("ui_accept"):
		if percent_visible == 1.0:
			if count < len(state_args):
				percent_visible = 0.0
				textbox_label.set_bbcode(state_args[count])
				count += 1
			else:
				set_state(States.NOTHING)
		elif percent_visible != 0.0:
			percent_visible = 1.0
			textbox_label.set_percent_visible(percent_visible)
	
	if percent_visible < 1.0 and total_char_count != 0.0:
		percent_visible += (1.0 / total_char_count) * textbox_speed * delta
		textbox_label.set_percent_visible(percent_visible)
	elif percent_visible > 1.0:
		percent_visible = 1.0
		textbox_label.set_percent_visible(percent_visible)

func _on_menu_button_pressed(index: int) -> void:
	set_state(States.NOTHING)
	emit_signal("menu_pressed", index)

func set_state(new_state: int, args := PoolStringArray()) -> void:
	count = 0
	state_args = args
	if new_state == States.NOTHING:
		set_process(false)
		Game.unpause()
		menu.hide()
		textbox.hide()
		match state:
			States.MENU:
				for node in menu.get_children():
					node.queue_free()
			States.TEXTBOX:
				emit_signal("textbox_hidden")
	else:
		set_process(true)
		Game.pause()
	state = new_state

func show_menu(args: PoolStringArray, alignment := BoxContainer.ALIGN_CENTER) -> void:
	set_state(States.MENU, args)
	menu.show()
	for i in range(len(args)):
		var button := UIBUTTON_RES.instance()
		var err := button.connect("pressed", self, "_on_menu_button_pressed", [i])
		if err:
			Game.print_error(self, "button.connect", err)
		else:
			button.set_text(args[i])
			menu.add_child(button)
			menu.set_alignment(alignment)
			if i == 0:
				button.grab_focus()

func show_textbox(args: PoolStringArray, alignment := BoxContainer.ALIGN_END) -> void:
	set_state(States.TEXTBOX, args)
	textbox.show()
	textbox.set_alignment(alignment)
	textbox_label.set_bbcode(state_args[count])
	textbox_label.set_percent_visible(0.0)
	count += 1

func append_textbox(text: String) -> void:
	var err := textbox_label.append_bbcode(text)
	if err:
		Game.print_error(self, "textbox_label.append_bbcode", err)
