extends Sprite

#Select the graphics to be used in the intro
export(Array, Texture) var graphics; 
export( String, FILE, "*.tscn" ) var startscreen;

#Variable Initiation
var state = "fadeIn";
var i = 0; 

# Called when the node enters the scene tree for the first time.
onready var viewport = get_viewport();

func _ready():
	#Center our Sprite
		position.x = viewport.size.x / 2;
		position.y = viewport.size.y / 2; 

func _on_GraphicTimer_timeout():
	#The transitioning Process
		if state == "fadeIn":
			set_texture(graphics[i])
			$GraphicAnimator.play("Fade In"); 
			state = "fadeOut";
			$GraphicTimer.wait_time = 2; 
			$GraphicTimer.start(); 
		elif state == "fadeOut":
			$GraphicAnimator.play("Fade Out");
			state = "pause";
			$GraphicTimer.wait_time = 1;
			$GraphicTimer.start(); 
		elif state == "pause":
			state = "fadeIn"
			$GraphicTimer.wait_time = 1;
			$GraphicTimer.start(); 
			i += 1;

	#When the whole thing is complete
		if state == "done":
			get_tree().change_scene(startscreen);
	
	#Conditions for when we are declared "Done"
		if i == graphics.size():
			state = "done"; 
			$GraphicTimer.wait_time = 1;
			$GraphicTimer.start(); 


func _process(delta):
	#Skip button
		var key_skip = Input.is_action_pressed("ui_accept");
		if key_skip: get_tree().change_scene(startscreen);


