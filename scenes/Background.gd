extends ParallaxBackground

@export var rate : float = 0.3

func _process(delta) -> void:
	scroll_base_offset += Vector2.RIGHT * rate
	scroll_base_offset += Vector2.DOWN * rate
	
