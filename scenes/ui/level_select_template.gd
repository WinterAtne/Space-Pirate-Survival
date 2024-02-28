extends HBoxContainer

var index : int = 0

signal level_selected(index : int)

func update_template(level_data : Level_Data, indx : int) -> void:
	index = indx
	
	$Button.text = level_data.name
	$Button.tooltip_text = level_data.description
	$TextureRect.texture = level_data.icon
	$Button.name = level_data.name
	

func _on_button_button_down():
	level_selected.emit(index)
