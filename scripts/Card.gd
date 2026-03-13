extends TextureRect

# Properties for the card
@export var card_name: String = "Card Name"
@export var mana_cost: int = 0
@export var card_image: Texture2D

# Drag and drop state
var is_dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

func _ready() -> void:
	if card_image:
		texture = card_image
	print("Card initialized: ", card_name)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
			drag_offset = get_global_mouse_position() - global_position
			# Ensure the card is drawn on top of others while being moved
			move_to_front()
		else:
			is_dragging = false

func _process(_delta: float) -> void:
	if is_dragging:
		global_position = get_global_mouse_position() - drag_offset