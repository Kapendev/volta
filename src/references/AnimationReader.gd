extends Node

static func read(path: String) -> Dictionary:
	var result = {}
	var file := File.new()
	var err := file.open(path, File.READ)
	if err:
		printerr("AnimationReader: file.open -> error = " + str(err))
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
					result[key] = [] # PoolIntArray not working?
				else:
					result[key].append(int(value))
			if not result[key]:
				result.erase(key)
		file.close()
	return result
