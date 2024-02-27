extends Area2D

func _on_body_exited(body) -> void:
	if body.has_method("damage"):
		body.damage()
		
	else:
		body.queue_free()
	
