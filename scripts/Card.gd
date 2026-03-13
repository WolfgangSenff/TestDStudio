extends TextureRect

# Properties for the card
export(String) var card_name = "Card Name"
export(int) var mana_cost = 0
export(Texture) var card_image

# Drag and drop state
var is_dragging = false
var drag_offset = Vector2.ZERO

func _ready():
	if card_image:
		texture = card_image
	print("Card initialized: ", card_name)

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				is_dragging = true
				drag_offset = get_global_mouse_position() - global_position
				# Ensure the card is drawn on top of others while being moved
				raise()
			else:
				is_dragging = false

func _process(_delta):
	if is_dragging:
		global_position = get_global_mouse_position() - drag_offset