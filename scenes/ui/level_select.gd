extends CanvasLayer

@export var button_template : PackedScene

signal level_selected(index : int)

func _ready():
	var index : int = 0
	
	for l in LevelLists.levels:
		var button = button_template.instantiate()
		button.update_template(l, index)
		button.level_selected.connect(transmit_singal.bind())
		$Buttons/VBoxContainer.add_child(button)
		
		
		index += 1
	

func transmit_singal(index : int) -> void:
	level_selected.emit(index)
	
