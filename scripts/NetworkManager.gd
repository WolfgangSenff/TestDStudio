extends Node

const DEFAULT_PORT = 8910
const MAX_CLIENTS = 2

signal connection_success
signal connection_failed

func create_game():
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(DEFAULT_PORT, MAX_CLIENTS)
	if error != OK:
		return error
	multiplayer.multiplayer_peer = peer
	print("Server started on port ", DEFAULT_PORT)

func join_game(address = "127.0.0.1"):
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(address, DEFAULT_PORT)
	if error != OK:
		connection_failed.emit()
		return error
	multiplayer.multiplayer_peer = peer
	connection_success.emit()