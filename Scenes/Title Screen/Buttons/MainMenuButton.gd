extends Button

export( String, FILE, "*.tscn" ) var destination;
#export( String ) var label

func _ready():
	#$Label.text = label; 
	pass

func _on_MenuButton_pressed():
	get_tree().change_scene(destination);
	pass
