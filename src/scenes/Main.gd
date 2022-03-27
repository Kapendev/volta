extends Control

enum Menu {PLAY, CONTINUE, OPTIONS, EXIT}

func _ready() -> void:
	$Menu.connect("pressed", self, "_on_menu_pressed")

func _on_menu_pressed(index: int) -> void:
	match index:
		Menu.PLAY:
			print("Play")
		Menu.CONTINUE:
			print("Continue")
		Menu.OPTIONS:
			print("Options")
		Menu.EXIT:
			print("Exit")
