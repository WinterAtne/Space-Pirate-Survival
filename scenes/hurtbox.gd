extends Node

func _on_body_entered(body) -> void:
	#It can collide with itself so we need to make sure it doesn't
	if body.has_method("damage") and not get_parent() == body:
		await get_tree().physics_frame
		body.damage.call_deferred()
		
	
