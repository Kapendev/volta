class_name EventSprite
extends AnimationSprite

enum Compass {
	E, NE, N, NW, W, SW, S, SE,
}

var event: Event

func _ready() -> void:
	event = get_parent()

func _physics_process(_delta: float) -> void:
	var animation_name: String
	if event.is_moving:
		animation_name = "move_"
	else:
		animation_name = "idle_"
	
	var direction := int(round((event.last_move_direction.angle() / (PI / 4.0) + 8.0))) % 8
	match direction:
		Compass.E:
			animation_name += "e"
		Compass.NE:
			animation_name += "ne"
		Compass.N:
			animation_name += "n"
		Compass.NW:
			animation_name += "nw"
		Compass.W:
			animation_name += "w"
		Compass.SW:
			animation_name += "sw"
		Compass.S:
			animation_name += "s"
		Compass.SE:
			animation_name += "se"
	set_current_animation(animation_name)
