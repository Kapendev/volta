class_name Event
extends KinematicBody2D

enum {
	LEFT, RIGHT, UP, DOWN,
	LOW, MEDIUM, HIGH
}

export var move_speed := 120
var current_move_speed := move_speed
var last_direction := RIGHT

var __accde := int(sqrt(move_speed))
var __vector := Vector2()

func move(direction: int) -> void:
	__vector = Vector2.ZERO
	var delta := get_physics_process_delta_time()
	match direction:
		LEFT:
			__vector.x = -current_move_speed * delta
		RIGHT:
			__vector.x = current_move_speed * delta
		UP:
			__vector.y = -current_move_speed * delta
		DOWN:
			__vector.y = current_move_speed * delta
	move_and_collide(__vector)
	last_direction = direction

func input_move(direction: int) -> void:
	var action := ""
	match direction:
		LEFT:
			action = "ui_left"
		RIGHT:
			action = "ui_right"
		UP:
			action = "ui_up"
		DOWN:
			action = "ui_down"
	if action and Input.is_action_pressed(action):
		move(direction)

func apply_accde(rate: int) -> void:
	var n := __accde
	match rate:
		LOW:
			n += n / 2
		MEDIUM:
			n /= 2
		HIGH:
			n /= 4
	if Input.is_action_pressed("ui_left") \
	or Input.is_action_pressed("ui_right") \
	or Input.is_action_pressed("ui_up") \
	or Input.is_action_pressed("ui_down"):
		current_move_speed = min(current_move_speed + n, move_speed)
	elif current_move_speed > 0:
		current_move_speed -= n + n / 2
		if current_move_speed < 0:
			current_move_speed = 0
		move(last_direction)
