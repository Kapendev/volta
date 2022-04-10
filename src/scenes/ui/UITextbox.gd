extends VBoxContainer

signal activated()
signal deactivated()

var index := 0
var text_speed := 26
var args := PoolStringArray()
var label: RichTextLabel

func _ready() -> void:
	label = get_node("Panel/Label")
	hide()
	set_process(false)

func _process(delta: float) -> void:
	var total_char_count := label.get_total_character_count()
	var percent_visible := label.get_percent_visible()
	if Input.is_action_just_pressed("ui_accept"):
		if percent_visible == 1.0:
			if index < len(args):
				percent_visible = 0.0
				label.set_bbcode(args[index])
				index += 1
			else:
				deactivate()
		elif percent_visible != 0.0:
			percent_visible = 1.0
	
	if percent_visible < 1.0 and total_char_count != 0.0:
		percent_visible += (1.0 / total_char_count) * text_speed * delta
	elif percent_visible > 1.0:
		percent_visible = 1.0
	label.set_percent_visible(percent_visible)

func activate(new_args: PoolStringArray, new_alignment := BoxContainer.ALIGN_END) -> void:
	if new_args:
		label.set_bbcode(new_args[0])
		label.set_percent_visible(0.0)
		index = 1
		args = new_args
		alignment = new_alignment
		show()
		set_process(true)
		emit_signal("activated")

func deactivate() -> void:
	index = 0
	hide()
	set_process(false)
	emit_signal("deactivated")

func append_textbox(text: String) -> void:
	var err := label.append_bbcode(text)
	if err:
		Error.echo(name, "label.append_bbcode", err)
