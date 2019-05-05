extends Node

# In order for this script to work correctly, set your project settings to the following
# Window->Stretch->Mode = Viewport
# Window->Size->Resizable = False
# Window->Size->Borderless = True
# Window->Stretch->Aspect = Ignore
# Rendering->Quality->2D Pixel Snap = True

onready var viewport = get_viewport();
onready var screen_size = OS.get_screen_size();

#onready var root = get_tree().get_root();
#onready var base_size = root.get_rect().size; 

func _ready():
	get_tree().connect("screen_resized", self, "_screen_resized");
	
	var window_scale_x= floor( screen_size.x / viewport.size.x  );
	var window_scale_y= floor( screen_size.y / viewport.size.y  );
	
	#OS.set_window_size(Vector2((window_scale_x * screen_size.x) - 100, (window_scale_y * screen_size.y) - 100));#Set Window Size
	OS.set_window_size(Vector2( screen_size.x - (screen_size.x / 3), screen_size.y - (screen_size.y / 3)));#Set Window Size
	OS.center_window();
	
	_screen_resized(); 

func _screen_resized():
	var window_size = OS.get_window_size()
	var scale_x = floor( window_size.x / viewport.size.x );
	var scale_y = floor( window_size.y / viewport.size.y );
	
	var scale = max( 1, min(scale_x, scale_y) );
	
	var diff = window_size - ( viewport.size * scale );
	var diffhalf = ( diff * 0.5 ).floor(); 
	
	
	#root.set_rect(Rect2(Vector2(),base_size))
	#root.set_render_target_to_screen_rect(Rect2(diffhalf, base_size * scale));
	viewport.set_attach_to_screen_rect(Rect2( diffhalf, viewport.size * scale ));
