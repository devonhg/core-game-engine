extends Node

# In order for this script to work correctly, set your project settings to the following
# Window->Stretch->Mode = Viewport
# Window->Size->Resizable = False
# Window->Stretch->Aspect = Ignore
# Rendering->Quality->2D Pixel Snap = True

onready var viewport = get_viewport();
onready var screen_size = OS.get_screen_size();

# Kind of misleading calculated as such...
# screensize - ( screensize / scale )
# 4 = 75% coverage, 5 = 80% coverage, etc...
# In short, the bigger the number, the more the coverage
var scale = 5; 


func _ready():
	var window_width = ceil((screen_size.x - (screen_size.x / scale)) / viewport.size.x) * viewport.size.x;
	var window_height = ceil((screen_size.y - (screen_size.y / scale)) / viewport.size.y) * viewport.size.y;

	OS.set_window_size(
		Vector2( 
			window_width,
			window_height
		)
	);
	OS.center_window();
