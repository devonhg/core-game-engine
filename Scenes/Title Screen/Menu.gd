extends VBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var viewport = get_viewport();

func _ready():
	$CenterRow/ButtonsAndGraphic/NewGame.grab_focus(); 
	
	var margin_base_x = floor(viewport.size.x / 24);
	margin_left = margin_base_x;
	margin_right = (viewport.size.x - margin_base_x) - viewport.size.x;
	
	var margin_base_y = floor(viewport.size.y / 24);
	margin_top = margin_base_y;
	margin_bottom = (viewport.size.y - margin_base_y) - viewport.size.y;

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
