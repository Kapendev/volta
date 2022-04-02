extends Node

func append(new_node: Node) -> void:
	if new_node.get_parent() != self:
		var is_persistent := false
		for node in get_children():
			if node.name == new_node.name:
				is_persistent = true
				break
		if not is_persistent:
			add_child(new_node.duplicate())
		new_node.queue_free()

func empty() -> void:
	for node in get_children():
		node.queue_free()
