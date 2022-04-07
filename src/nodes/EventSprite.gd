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
	if event.last_move_direction.normalized() == Vector2(-1,0).normalized():
		current_animation = "walk_left"
	elif event.last_move_direction.normalized() == Vector2(1, 0).normalized():
		current_animation = "walk_right"
	elif event.last_move_direction.normalized() == Vector2(0, -1).normalized():
		current_animation = "walk_up"
	elif event.last_move_direction.normalized() == Vector2(0, 1).normalized():
		current_animation = "walk_down"
#	elif event.last_move_direction.normalized() == Vector2(-1,-1).normalized():
#		current_animation = "walk_upleft"
#	elif event.last_move_direction.normalized() == Vector2(1, -1).normalized():
#		current_animation = "walk_upright"
#	elif event.last_move_direction.normalized() == Vector2(-1, -1).normalized():
#		current_animation = "walk_downleft"
#	elif event.last_move_direction.normalized() == Vector2(-1, 1).normalized():
#		current_animation = "walk_downright"
