extends Node

func _ready():
	if not get_parent() is RigidBody2D:
		push_warning("Gravity Object asigned non Rigidbody parent " + str(RID(self)))
		return
	
	Gravity.add_gravity_object(get_parent())
	queue_free()
