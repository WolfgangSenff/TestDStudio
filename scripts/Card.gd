extends TextureRect

# Properties for the card
export(String) var card_name = "Card Name"
export(int) var mana_cost = 0
export(Texture) var card_image

func _ready():
	if card_image:
		texture = card_image
	print("Card initialized: ", card_name)