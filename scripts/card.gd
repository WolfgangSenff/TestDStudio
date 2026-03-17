extends TextureRect

const PREVIEW_SCENE = preload("res://card_preview.tscn")

@onready var title_label = %TitleLabel
@onready var illustration = %Illustration
@onready var description_label = %DescriptionLabel
@onready var icon_container = %LeftIcons

func _ready():
	# Initialize card data here
	pass

func _get_drag_data(_at_position: Vector2):
	# Create a preview by instantiating the preview scene
	# This allows for editor-based styling instead of code-based styling
	var preview = PREVIEW_SCENE.instantiate()
	
	set_drag_preview(preview)
	
	# Return the node itself as the drag data
	return self

func _can_drop_data(_at_position: Vector2, data) -> bool:
	# Check if the dropped data is another card
	return data is TextureRect

func _drop_data(_at_position: Vector2, data):
	# Logic for when a card is dropped onto this card
	print("Dropped ", data.name, " onto ", name)