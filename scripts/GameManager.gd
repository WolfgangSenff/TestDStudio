extends Node

@export var deck = []
var players = {}

func _ready():
	multiplayer.peer_connected.connect(_on_peer_connected)

func _on_peer_connected(id):
	print("Player connected: ", id)
	players[id] = {"hand": []}