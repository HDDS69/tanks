extends Node
var save = "user://save.save"
var nickname1 = "player"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func save_game():
	var  file = FileAccess.open(save , FileAccess.WRITE)
	file.store_var(nickname1)
	
	
	
func load_game():
	var file = FileAccess.open(save , FileAccess.READ)
	#nickname1 = file.get_var(true)
