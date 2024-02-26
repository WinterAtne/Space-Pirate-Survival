extends Node

const gravity : float = 10.0
var gravity_objects : Array[RigidBody2D] = []

func add_gravity_object(rb : RigidBody2D) -> void:
	gravity_objects.append(rb)
	

func _physics_process(delta):
	for target in gravity_objects:
		for attractor in gravity_objects:
			if target == attractor:
				continue
				
			
			var force : float = gravity * ((target.mass * attractor.mass) / pow(target.position.distance_to(attractor.position), 2))
			var direction : Vector2 = target.position.direction_to(attractor.position)
			
			target.apply_central_force(force * direction * delta)
			
		
	
