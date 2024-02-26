extends Node

func _ready():
	if not get_parent() is RigidBody2D:
		push_warning("Gravity Object asigned non Rigidbody parent " + str(RID(self)))
		return
	
	Gravity.add_gravity_object(get_parent())
	

func _exit_tree() -> void:
	Gravity.remove_gravity_object(get_parent())
	
