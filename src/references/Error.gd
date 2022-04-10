class_name Error
extends Reference

static func echo(object_name: String, line_name: String, err: int) -> void:
	printerr("Error: %s -> %s -> %d" % [object_name, line_name, err])
