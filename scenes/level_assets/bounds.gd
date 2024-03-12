extends Area2D

func _on_body_exited(body) -> void:
	body.queue_free()
	
