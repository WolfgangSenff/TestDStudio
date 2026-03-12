extends Node2D

var card_id: int
var suit: String
var rank: int

func setup(p_id, p_suit, p_rank):
	card_id = p_id
	suit = p_suit
	rank = p_rank