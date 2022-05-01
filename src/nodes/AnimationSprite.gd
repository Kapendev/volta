# A better AnimatedSprite.

# Set hframes and vframes 
# to the correct values before using this node.

class_name AnimationSprite
extends Sprite

var index := 0
var timer := 0.0
var animations := {} # Text : { Double, List Natural }

export var is_playing := true
export var animation := ""
export(String, FILE, "*.json") var path := ""

# Read json file.
func _ready() -> void:
	var file := File.new()
	var err := file.open(path, File.READ)
	if err:
		Error.echo(name, "file.open", err)
	else:
		var json := JSON.parse(file.get_as_text())
		if json.error:
			Error.echo(name, "JSON.parse", json.error)
		else:
			animations = json.result
		file.close()
	if is_playing:
		play()
	else:
		stop()

# Update timer, index and frame.
func _process(delta: float):
	var time: float = animations[animation]["time"]
	var frames: Array = animations[animation]["frames"]
	timer += delta
	if timer >= time / len(frames):
		timer = 0.0
		index += 1
		if index >= len(frames):
			index = 0
		frame = frames[index]

func set_animation(value: String) -> void:
	var frames: Array = animations[animation]["frames"]
	if index >= len(frames):
		index = 0
		frame = frames[0]
	animation = value

func play() -> void:
	var can_play := animations.has(animation)
	set_process(can_play)
	is_playing = can_play

func stop() -> void:
	set_process(false)
	is_playing = false
