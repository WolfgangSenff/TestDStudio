extends TextureRect

@onready var title_label = $HBox/MainContent/TitleLabel
@onready var illustration = $HBox/MainContent/Illustration
@onready var description_label = $HBox/MainContent/DescriptionLabel
@onready var icon_container = $HBox/LeftIcons

func _ready():
	# Initialize card data here
	pass

func _get_drag_data(at_position: Vector2):
	# Create a preview of the card
	var preview = TextureRect.new()
	preview.texture = texture
	preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview.size = size * 0.5 # Scale down for preview
	
	var preview_control = Control.new()
	preview_control.add_child(preview)
	preview.position = -0.5 * preview.size
	
	set_drag_preview(preview_control)
	
	# Return the node itself as the drag data
	return self

func _can_drop_data(_at_position: Vector2, data) -> bool:
	# Check if the dropped data is another card
	return data is TextureRect

func _drop_data(_at_position: Vector2, data):
	# Logic for when a card is dropped onto this card
	print("Dropped ", data.name, " onto ", name)
