extends Control

enum StartMenu {NEW, CONTINUE, OPTIONS, EXIT}

func _ready() -> void:
	Persistent.empty()
	var err := UI.menu.connect("deactivated", self, "_on_menu_deactivated")
	if err:
		Game.print_error(self, "UI.menu.connect", err)
	else:
		UI.menu.activate(["New Game", "Continue", "Options", "Exit"], BoxContainer.ALIGN_END)

func _on_menu_deactivated(index: int) -> void:
	match index:
		StartMenu.NEW:
			Game.change_scene("levels/TestLevel1")
		StartMenu.CONTINUE:
			Game.change_scene("levels/TestLevel1")
		StartMenu.OPTIONS:
			Game.change_scene("levels/TestLevel1")
		StartMenu.EXIT:
			Game.change_scene("levels/TestLevel1")
	UI.menu.disconnect("deactivated", self, "_on_menu_deactivated")
