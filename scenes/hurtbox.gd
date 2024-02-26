extends Node

func _on_body_entered(body) -> void:
	if body.has_method("damage"):
		body.damage()
		
	
