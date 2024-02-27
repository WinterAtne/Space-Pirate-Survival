extends ParallaxBackground

func _process(delta) -> void:
	scroll_base_offset += Vector2.RIGHT * 0.3
	scroll_base_offset += Vector2.DOWN * 0.3
