extends Control
class_name CardUI

var data: CardData

@onready var name_label: Label = $NameLabel
@onready var cost_label: Label = $CostLabel
@onready var description_label: Label = $DescriptionLabel
@onready var art_rect: TextureRect = $ArtRect

func update_ui(new_data: CardData) -> void:
	data = new_data
	name_label.text = data.card_name
	cost_label.text = str(data.cost)
	description_label.text = data.description
	art_rect.texture = data.texture
