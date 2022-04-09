class_name EventSprite
extends AnimationSprite

# TESTING THINGS!!!
# Also maybe fix crash when setting current_animation to something that is not real.

enum Direction {
	LEFT, RIGHT, UP, DOWN,
	UP_LEFT, UP_RIGHT, DOWN_LEFT, DOWN_RIGHT,
}

var event: Event

func _ready() -> void:
	event = get_parent()

func _physics_process(delta: float) -> void:
	var direction := event.last_move_direction.normalized()
	if direction == Vector2.LEFT:
		if current_animation != "walk_left":
			set_current_animation("walk_left")
	elif direction == Vector2.RIGHT:
		if current_animation != "walk_right":
			set_current_animation("walk_right")
	elif direction == Vector2.UP:
		if current_animation != "walk_up":
			set_current_animation("walk_up")
	elif direction == Vector2.DOWN:
		if current_animation != "walk_down":
			set_current_animation("walk_down")
#	elif direction == Vector2.LEFT:
#		if current_animation != "walk_up_left":
#			set_current_animation("walk_left")
#	elif direction == Vector2.RIGHT:
#		if current_animation != "walk_up_right":
#			set_current_animation("walk_right")
#	elif direction == Vector2.UP:
#		if current_animation != "walk_down_left":
#			set_current_animation("walk_up")
#	elif direction == Vector2.DOWN:
#		if current_animation != "walk_down_right":
#			set_current_animation("walk_down")
