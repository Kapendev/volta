extends Control

enum StartMenu {NEW, CONTINUE, OPTIONS, EXIT}

func _ready() -> void:
	Game.connect("menu_pressed", self, "_on_menu_pressed")
	Game.show_menu(["New Game", "Continue", "Options", "Exit"], BoxContainer.ALIGN_END)

func _on_menu_pressed(index: int) -> void:
	match index:
		StartMenu.NEW:
			Game.change_scene("levels/TestLevel")
		StartMenu.CONTINUE:
			Game.change_scene("levels/TestLevel")
		StartMenu.OPTIONS:
			Game.change_scene("levels/TestLevel")
		StartMenu.EXIT:
			Game.change_scene("levels/TestLevel")
	Game.disconnect("menu_pressed", self, "_on_menu_pressed")
