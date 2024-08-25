extends Node2D

func _ready():
	Autoload.load_game()	
	if not multiplayer.is_server():
		return
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(del_player)
	
	for id in multiplayer.get_peers():
		add_player(id)

	if not OS.has_feature("dedicated_server"):
		add_player(1)
		
func _exit_tree():
	if not multiplayer.is_server():
		return
	multiplayer.peer_connected.disconnect(add_player)
	multiplayer.peer_disconnected.disconnect(del_player)

func add_player(id: int):
	var character = preload("res://player1.tscn").instantiate()
	character.player = id
	character.name = str(id)
	$player.add_child(character, true)
	
	
func del_player(id: int):
	if not $player.has_node(str(id)):
		return
	$player.get_node(str(id)).queue_free()

func _process(delta):
	pass
