class_name PlayerEvent
extends Event

export var can_move_horizontally := true
export var can_move_vertically := true

func _ready() -> void:
	init_hitbox()

func _physics_process(delta) -> void:
	iupdate_hitbox()
	if can_move_horizontally:
		imove(LEFT)
		imove(RIGHT)
	if can_move_vertically:
		imove(UP)
		imove(DOWN)
	if Input.is_action_just_pressed("ui_cancel"):
		change_scene("Main")
