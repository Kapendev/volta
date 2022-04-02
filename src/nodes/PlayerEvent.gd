class_name PlayerEvent
extends Event

export var can_move_horizontally := true
export var can_move_vertically := true
var move_direction := Vector2()

func _ready() -> void:
	Persistent.append(self)
	init_hitbox()

func _physics_process(_delta: float) -> void:
	move_direction = Vector2.ZERO
	if can_move_horizontally:
		if Input.is_action_pressed("ui_left"):
			move_direction.x -= 1
		if Input.is_action_pressed("ui_right"):
			move_direction.x += 1
	if can_move_vertically:
		if Input.is_action_pressed("ui_up"):
			move_direction.y -= 1
		if Input.is_action_pressed("ui_down"):
			move_direction.y += 1
	move(move_direction)
	move_hitbox(last_move_direction)
	
	if Input.is_action_just_pressed("ui_accept"):
		var _body := hit()
