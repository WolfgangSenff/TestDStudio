extends Node2D

# The card script instantiates a visual representation
const VisualsScene = preload("res://scenes/card_visuals.tscn")

func _ready():
	var visuals = VisualsScene.instantiate()
	add_child(visuals)
