tool
class_name FadeInEffect
extends RichTextEffect

# TODO: not wat i want

var bbcode := "fadein"
var a = 0.0

func _process_custom_fx(char_fx):
	if char_fx.absolute_index == 0:
		_update()
	char_fx.color.a = a
	return true

func _update():
	if a < 1:
		a += 0.01
