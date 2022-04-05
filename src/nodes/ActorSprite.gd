class_name ActorSprite
extends Sprite

# NOTE: maybe this is good node now?

export var is_playing := true
export var frame_time := 0.2
export var current_animation := "" setget set_current_animation

# name,frame1,frame2,...\n
export(String, MULTILINE) var animation_info := "" setget set_animation_info

var index := 0
var timer := 0.0
var animations := {} # String: [int]

func _ready() -> void:
	set_animation_info(animation_info)
	set_current_animation(current_animation)
	set_frame(animations[current_animation][index])

func _process(delta: float) -> void:
	if is_playing:
		timer += delta
		if timer >= frame_time:
			timer = 0.0
			next_frame()

func next_index() -> void:
	index += 1
	if index >= len(animations[current_animation]):
		index = 0

func get_frame_count() -> int:
	return vframes * hframes

func set_frame(value: int) -> void:
	if value > -1 and value < get_frame_count():
		frame = value

func next_frame() -> void:
	next_index()
	set_frame(animations[current_animation][index])

func set_current_animation(value: String) -> void:
	current_animation = value
	index = 0
	set_process(current_animation in animations)

func set_animation_info(value: String) -> void:
	animation_info = value
	var key: String
	for line in animation_info.split('\n', false):
		key = ""
		for value in line.split(',', false):
			if key.empty():
				key = value
				animations[key] = [] # PoolIntArray not working?
			else:
				animations[key].append(int(value))
	set_current_animation(current_animation)
