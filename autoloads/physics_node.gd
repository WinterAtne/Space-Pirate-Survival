extends Sprite2D
class_name PhysicsNode

#Parameters
@export var mass : float = 1
@export var radius : float = 10

@export var is_attractor = false
@export var is_orbiter = true

#State
var velocity : Vector2 = Vector2.ZERO
var paused : bool = false

func _enter_tree():
	if is_attractor: Fisics.attractors.append(self)
	

func _exit_tree():
	if is_attractor: Fisics.attractors.erase(self)
	

func _process(delta):
	if paused:
		return
		
	
	#Movement
	if is_orbiter: velocity += Fisics.get_gravity(self, delta)
	global_position += (velocity * delta)
	

func _body_entered(body : PhysicsNode):
	pass
	
