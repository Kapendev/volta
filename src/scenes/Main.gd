extends Control

enum StartMenu {NEW, CONTINUE, OPTIONS, EXIT}

func _ready() -> void:
	Persistent.empty()
	var err := UI.connect("menu_pressed", self, "_on_menu_pressed")
	if err:
		Game.print_error(self, "UI.connect", err)
	else:
		UI.show_menu(["New Game", "Continue", "Options", "Exit"], BoxContainer.ALIGN_END)

func _on_menu_pressed(index: int) -> void:
	match index:
		StartMenu.NEW:
			Game.change_scene("levels/TestLevel1")
		StartMenu.CONTINUE:
			Game.change_scene("levels/TestLevel1")
		StartMenu.OPTIONS:
			Game.change_scene("levels/TestLevel1")
		StartMenu.EXIT:
			Game.change_scene("levels/TestLevel1")
	UI.disconnect("menu_pressed", self, "_on_menu_pressed")
