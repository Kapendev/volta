class_name ActorSprite
extends Sprite

# NOTE: no idea what I'm doing

export var is_vertical := false
export var is_playing := false
export var current_animation := 0
export var current_frame := 0
export var animation_speed := 0.2
var timer := 0.0

func _process(delta: float) -> void:
	timer += delta
	if timer >= animation_speed and is_playing:
		timer = 0.0
		frame = current_animation * hframes + current_frame
		current_frame += 1
		if current_frame >= hframes:
			current_frame = 0
