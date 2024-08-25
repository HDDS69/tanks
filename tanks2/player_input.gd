extends MultiplayerSynchronizer

@export var direction := Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())
