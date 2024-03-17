extends Node

const gravity : float = 1.0
var attractors : Array[PhysicsNode] = []

func get_gravity(body : PhysicsNode, delta : float) -> Vector2:
	var total : Vector2 = Vector2.ZERO
	
	for attractor in attractors:
		var direction : Vector2 = body.position.direction_to(attractor.position)
		var force := gravity * attractor.mass / body.position.distance_squared_to(attractor.position)
		
		total += direction * force
		
	
	total /= body.mass
	total *= delta * 60 #Delta is multiplied here to make the numbers everywhere smaller & more efficient
	
	return total
	
