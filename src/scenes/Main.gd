extends Control

enum Menu {NEW, CONTINUE, OPTIONS, EXIT}

func _ready() -> void:
	var menu := $Menu
	menu.connect("pressed", self, "_on_menu_pressed")
	menu.grab_focus_from(0)

func _on_menu_pressed(index: int) -> void:
	match index:
		Menu.NEW:
			print("New")
			get_tree().change_scene("res://src/scenes/levels/TestLevel.tscn")
		Menu.CONTINUE:
			print("Continue")
		Menu.OPTIONS:
			print("Options")
		Menu.EXIT:
			print("Exit")
