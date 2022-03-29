class_name Event
extends KinematicBody2D

# TODO: Interact with other events (hitbox is done)
# NOTE: Think about the CollisionShape2D name used in init_hitbox

enum {
	NOTHING,
	LEFT, RIGHT, UP, DOWN,
	LOW, MEDIUM, HIGH
}

const SCENE_DIR = "res://src/scenes/"

export var move_speed := 120
var current_move_speed := move_speed
var move_direction := RIGHT

var hitbox: Area2D setget set_hitbox
var hitbox_offset_x := 0
var hitbox_offset_y := 0

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
	move_direction = direction

func imove(direction: int) -> void:
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
		move(move_direction)

func change_scene(scene: String) -> void:
	get_tree().change_scene(SCENE_DIR + scene + ".tscn")

func move_hitbox(direction: int) -> void:
	match direction:
		LEFT:
			hitbox.position.x = -hitbox_offset_x
		RIGHT:
			hitbox.position.x = hitbox_offset_x
		UP:
			hitbox.position.y = -hitbox_offset_y
		DOWN:
			hitbox.position.y = hitbox_offset_y

func init_hitbox() -> void:
	if hitbox:
		var collision := get_node("CollisionShape2D")
		hitbox_offset_x = collision.shape.extents.x * 2
		hitbox_offset_y = collision.shape.extents.y * 2
	else:
		var collision := CollisionShape2D.new()
		hitbox = Area2D.new()
		hitbox.add_child(collision)
		add_child(hitbox)
		
		collision.shape = get_node("CollisionShape2D").shape.duplicate()
		hitbox_offset_x = collision.shape.extents.x * 2
		hitbox_offset_y = collision.shape.extents.y * 2
		collision.shape.extents /= 2
	move_hitbox(move_direction)

func set_hitbox(value: Area2D) -> void:
	hitbox = value
	init_hitbox()

func update_hitbox() -> void:
	hitbox.position = Vector2.ZERO
	move_hitbox(move_direction)

func iupdate_hitbox() -> void:
	var x := NOTHING
	var y := NOTHING
	if Input.is_action_pressed("ui_left"):
		x = LEFT
	elif Input.is_action_pressed("ui_right"):
		x = RIGHT
	if Input.is_action_pressed("ui_up"):
		y = UP
	elif Input.is_action_pressed("ui_down"):
		y = DOWN
	if x:
		move_hitbox(x)
		hitbox.position.y = 0
	if y:
		move_hitbox(y)
		if not x:
			hitbox.position.x = 0
