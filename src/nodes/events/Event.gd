class_name Event
extends KinematicBody2D

# NOTE: Think about the CollisionShape2D name used in init_hitbox

var is_moving := false
var move_speed := 160
var current_move_speed := move_speed
var last_move_direction := Vector2.RIGHT

var hitbox: Area2D setget set_hitbox
var hitbox_offset := 0

func move(direction: Vector2) -> void:
	is_moving = direction != Vector2.ZERO
	if is_moving:
		var _vector := move_and_slide(direction.normalized() * current_move_speed)
		last_move_direction = direction

func apply_accde(rate: int) -> void:
	if is_moving:
		current_move_speed = int(min(current_move_speed + rate, move_speed))
	elif current_move_speed > 0:
		current_move_speed -= rate * 2
		if current_move_speed < 0:
			current_move_speed = 0
		move(last_move_direction)

func init_hitbox() -> void:
	if hitbox:
		var collision := get_node("CollisionShape2D")
		hitbox_offset = collision.shape.extents.y * 2
	else:
		var collision := CollisionShape2D.new()
		hitbox = Area2D.new()
		hitbox.add_child(collision)
		add_child(hitbox)
		
		collision.shape = get_node("CollisionShape2D").shape.duplicate()
		hitbox_offset = collision.shape.extents.y * 2
		collision.shape.extents /= 2

func set_hitbox(value: Area2D) -> void:
	hitbox = value
	init_hitbox()

func move_hitbox(direction: Vector2) -> void:
	hitbox.position = direction * hitbox_offset

func react(body: KinematicBody2D) -> void:
	print("%s -> %s" % [body.name, name])

func hit() -> KinematicBody2D:
	var result: KinematicBody2D
	var smallest_distance := INF
	for body in hitbox.get_overlapping_bodies():
		if body is KinematicBody2D:
			var distance := position.distance_to(body.position)
			if distance < smallest_distance:
				smallest_distance = distance
				result = body
	if result:
		result.react(self)
	return result
