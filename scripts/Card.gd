extends Control

# Static variable ensures only one card is tracked across all instances
static var dragging_card: Control = null

var drag_offset: Vector2 = Vector2.ZERO

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Only allow drag if no other card is currently being dragged
				if dragging_card == null:
					dragging_card = self
					drag_offset = get_global_mouse_position() - global_position
					
					# Bring to front
					z_index = 100
					raise()
			elif dragging_card == self:
				# Release the drag state
				dragging_card = null
				z_index = 0

func _process(_delta: float) -> void:
	if dragging_card == self:
		# Follow the mouse
		global_position = get_global_mouse_position() - drag_offset