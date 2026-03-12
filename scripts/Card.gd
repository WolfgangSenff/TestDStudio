extends Sprite2D

var is_dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Check if mouse is over the sprite
				if get_rect().has_point(to_local(event.global_position)):
					is_dragging = true
					drag_offset = global_position - event.global_position
			else:
				is_dragging = false

func _process(_delta: float) -> void:
	if is_dragging:
		global_position = get_global_mouse_position() + drag_offset