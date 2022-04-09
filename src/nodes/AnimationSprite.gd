class_name AnimationSprite
extends Sprite

export var is_playing := true
export var frame_time := 0.2
export var current_animation := "idle" setget set_current_animation
export(String, FILE, "*.txt") var path := ""

var index := 0
var timer := 0.0
var animations := {} # String: [int]

func _ready() -> void:
	if path:
		load_animations()
	set_current_animation(current_animation)

func _process(delta: float) -> void:
	if is_playing:
		timer += delta
		if timer >= frame_time:
			timer = 0.0
			next_frame()

func next_frame() -> void:
	if current_animation in animations:
		index += 1
		if index >= len(animations[current_animation]):
			index = 0
		if animations[current_animation][index] >= 0 and animations[current_animation][index] < vframes * hframes:
			frame = animations[current_animation][index]

func set_current_animation(value: String) -> void:
	if value != current_animation and value in animations:
		current_animation = value
		if index >= len(animations[current_animation]):
			index = 0
		frame = animations[current_animation][index]

func load_animations() -> void:
	var file := File.new()
	var err := file.open(path, File.READ)
	if err:
		Game.print_error(self, "file.open", err)
	else:
		var key := ""
		var line := ""
		while not file.eof_reached():
			line = file.get_line()
			if line.empty():
				continue
			key = ""
			for value in line.split(',', false):
				if key.empty():
					key = value
					animations[key] = [] # PoolIntArray not working?
				else:
					animations[key].append(int(value))
			if not animations[key]:
				animations.erase(key)
		file.close()
