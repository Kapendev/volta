extends Node

const UIMENU_RES := preload("res://src/scenes/ui/UIMenu.tscn")
const UITEXTBOX_RES := preload("res://src/scenes/ui/UITextbox.tscn")

var canvas := CanvasLayer.new()
var menu: VBoxContainer = UIMENU_RES.instance()
var textbox: VBoxContainer = UITEXTBOX_RES.instance()

var dialogue_parser = DialogueParser.new()

func _ready() -> void:
	set_pause_mode(Node.PAUSE_MODE_PROCESS)
	add_child(canvas)
	canvas.add_child(menu)
	canvas.add_child(textbox)
