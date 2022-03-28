class_name PlayerEvent
extends Event

export var can_move_horizontally := true
export var can_move_vertically := true

func _physics_process(delta) -> void:
	if can_move_horizontally:
		input_move(LEFT)
		input_move(RIGHT)
	if can_move_vertically:
		input_move(UP)
		input_move(DOWN)
