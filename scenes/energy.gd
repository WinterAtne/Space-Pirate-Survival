extends RigidBody2D
class_name Energy

@export var amount_of_energy : float = 4



func damage() -> void:
	queue_free()
	



func _on_area_2d_body_entered(body):
	if body is Player:
		body.give_energy(amount_of_energy)
		damage()
		
	
