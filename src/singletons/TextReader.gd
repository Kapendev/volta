extends Node

const ESCAPE_CHAR := '\\'
const LANGUAGE_CHAR := '@'

func has_escape_char(line: String) -> bool:
	return line[len(line)-1] == ESCAPE_CHAR

func is_language_line(line: String) -> bool:
	return line[0] == LANGUAGE_CHAR

func is_current_language_line(line: String) -> bool:
	if line[0] == LANGUAGE_CHAR \
	and line.ends_with(Game.current_language):
		return true
	return false

func read(path: String) -> PoolStringArray:
	var result := PoolStringArray()
	var file := File.new()
	var err := file.open(path, File.READ)
	if err:
		Game.print_error(self, "file.open", err)
		return result
	
	var can_append := false
	var line := ""
	var append_line := ""
	while not file.eof_reached():
		line = file.get_line()
		if line.empty():
			continue
		if not can_append and is_language_line(line):
			can_append = is_current_language_line(line)
			continue
		
		if can_append:
			if append_line.empty():
				append_line = line
			else:
				append_line += line
			
			if is_language_line(append_line):
				break
			if has_escape_char(append_line):
				append_line.erase(len(append_line) - 1, 1)
			else:
				result.append(append_line)
				append_line = ""
	file.close()
	return result
