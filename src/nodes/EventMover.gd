class_name EventMover
extends Node

signal arrived
signal returned

export var is_moving := true
export var is_one_shot := false
export var wait_time := 0.5
export var positions := PoolVector2Array()

var is_going_back := false
var is_waiting := false
var current_position := 0
var timer := 0.0
var event: Event

func _ready() -> void:
	event = get_parent()
	if event and positions:
		set_physics_process(true)
		event.set_position(positions[current_position])
	else:
		set_physics_process(false)

func _physics_process(delta: float) -> void:
	if is_moving:
		if is_waiting:
			timer += delta
			if timer >= wait_time:
				is_waiting = false
				timer = 0.0
				next_position()
		else:
			event.move(positions[current_position] - event.position)
			if event.get_position().distance_to(positions[current_position]) < (event.current_move_speed * delta) / 2:
				is_waiting = true
				event.set_position(positions[current_position])
				event.move(Vector2.ZERO)

func next_position() -> void:
	if is_going_back:
		current_position -= 1
		if current_position < 0:
			if len(positions) > 1:
				current_position = 1
			else:
				current_position = 0
			is_going_back = false
			is_moving = not is_one_shot
			emit_signal("returned")
	else:
		current_position += 1
		if current_position >= len(positions):
			if len(positions) > 1:
				current_position = len(positions) - 2
			else:
				current_position = len(positions) - 1
			is_going_back = true
			is_moving = not is_one_shot
			emit_signal("arrived")
