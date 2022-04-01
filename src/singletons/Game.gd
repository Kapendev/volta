extends Node

signal menu_pressed(index)
signal textbox_hidden()

enum States {NOTHING, TEXTBOX}

const SCENE_DIR := "res://src/scenes/"
const UIBUTTON_RES := preload("res://src/scenes/ui/UIButton.tscn")

var count := 0
var state := 0
var state_args: PoolStringArray

var textbox_speed := 32

var menu: VBoxContainer
var textbox: VBoxContainer
var textbox_label: RichTextLabel
var rect: ColorRect

func _ready() -> void:
	add_child(load("res://src/scenes/ui/UI.tscn").instance())
	menu = get_node("UI/UIMenu")
	textbox = get_node("UI/UITextbox")
	textbox_label = get_node("UI/UITextbox/Panel/Label")
	rect = get_node("UI/UIRect")
	set_state(States.NOTHING)
	set_pause_mode(Node.PAUSE_MODE_PROCESS)
	hide_all()

func _input(event: InputEvent) -> void:
	match state:
		States.TEXTBOX:
			_state_input_textbox(event)

func _process(delta: float) -> void:
	match state:
		States.TEXTBOX:
			_state_process_textbox(delta)

func _state_input_textbox(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if textbox_label.percent_visible == 1.0:
			if count < len(state_args):
				textbox_label.set_bbcode(state_args[count])
				textbox_label.percent_visible = 0.0
				count += 1
			else:
				hide_textbox()
				set_state(States.NOTHING)
		else:
			textbox_label.percent_visible = 1.0

func _state_process_textbox(delta: float) -> void:
	if textbox_label.percent_visible < 1.0:
		textbox_label.percent_visible += \
		1.0 / textbox_label.get_total_character_count() * textbox_speed * delta
	elif textbox_label.percent_visible > 1.0:
		textbox_label.percent_visible = 1.0

func _on_menu_button_pressed(index: int) -> void:
	unpause()
	hide_menu()
	emit_signal("menu_pressed", index)

func pause() -> void:
	get_tree().set_pause(true)

func unpause() -> void:
	var tree := get_tree()
	yield(tree.create_timer(0.01), "timeout")
	tree.set_pause(false)

func change_scene(scene: String) -> void:
	get_tree().change_scene(SCENE_DIR + scene + ".tscn")

func get_current_scene() -> Node:
	return get_tree().get_current_scene()

func set_state(new_state: int, args := PoolStringArray()) -> void:
	state = new_state
	if state:
		pause()
		count = 0
		state_args = args
	else:
		unpause()
	set_process_input(state != States.NOTHING)
	set_process(is_processing_input())

func show_menu(args: PoolStringArray, alignment := BoxContainer.ALIGN_CENTER) -> void:
	if args:
		pause()
		menu.show()
		for i in range(len(args)):
			var button := UIBUTTON_RES.instance()
			button.connect("pressed", self, "_on_menu_button_pressed", [i])
			button.set_text(args[i])
			menu.add_child(button)
			menu.set_alignment(alignment)
			if i == 0:
				button.grab_focus()

func hide_menu() -> void:
	menu.hide()
	for button in menu.get_children():
		button.queue_free()

func show_textbox(args: PoolStringArray, alignment := BoxContainer.ALIGN_END) -> void:
	if args:
		set_state(States.TEXTBOX, args)
		textbox.show()
		textbox.set_alignment(alignment)
		textbox_label.set_bbcode(state_args[count])
		textbox_label.percent_visible = 0.0
		count += 1

func append_textbox(text: String) -> void:
	textbox_label.append_bbcode(text)

func hide_textbox() -> void:
	emit_signal("textbox_hidden")
	textbox.hide()

func show_rect(time := 0.0) -> void:
	rect.show()
	if time > 0.0:
		pause()
		yield(get_tree().create_timer(time), "timeout")
		unpause()
		rect.hide()

func hide_rect() -> void:
	rect.hide()

func hide_all() -> void:
	hide_menu()
	hide_textbox()
	hide_rect()
