extends ColorRect

# Called when the node enters the scene tree for the first time.
onready var viewport = get_viewport();

func _ready():
	rect_size = Vector2(viewport.size.x, viewport.size.y);