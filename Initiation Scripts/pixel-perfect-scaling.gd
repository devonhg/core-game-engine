extends Node

# In order for this script to work correctly, set your project settings to the following
# Window->Stretch->Mode = Viewport
# Window->Stretch->Aspect = Ignore
# Rendering->Quality->2D Pixel Snap = True

onready var viewport = get_viewport();
onready var screen_size = OS.get_screen_size();

func _ready():
	get_tree().connect("screen_resized", self, "_screen_resized");
	print("Full Window Ready");
	_screen_resized(); 

func _screen_resized():
	var window_size = OS.get_window_size()
	var scale_x = floor( window_size.x / viewport.size.x );
	var scale_y = floor( window_size.y / viewport.size.y );
	
	var window_scale_x= floor( screen_size.x / viewport.size.x  );
	var window_scale_y= floor( screen_size.y / viewport.size.y  );
	
	var scale = max( 1, min(scale_x, scale_y) );
	
	var diff = window_size - ( viewport.size * scale );
	var diffhalf = ( diff * 0.5 ).floor(); 
	
	OS.set_window_size(Vector2(window_scale_x * screen_size.x, window_scale_y * screen_size.y));#Set Window Size
	OS.center_window();
	
	viewport.set_attach_to_screen_rect(Rect2( diffhalf, viewport.size * scale ));
