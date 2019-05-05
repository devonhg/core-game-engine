extends KinematicBody2D

const UP = Vector2(0,-1);
const GRAVITY = 30;
const ACCELERATION = 50;
const MAX_SPEED = 400;
const JUMP = 600;

var friction = .15;
var state = 0; 
var motion = Vector2()

func _physics_process(delta):
	#Variables
		var key_right = Input.is_action_pressed("ui_right");
		var key_left = Input.is_action_pressed("ui_left");
		var key_up = Input.is_action_just_pressed("ui_up");
	
	#Universal
		motion.y += GRAVITY;
		var move = int(key_right) + -int(key_left);
		motion.x = lerp(motion.x, MAX_SPEED * move, friction);
		if move == 1:
			$Sprite.flip_h = false;
		elif move == -1:
			$Sprite.flip_h = true;

	#State Conditions
		if is_on_floor():
			if move != 0:
				state = 1;
			else:
				state = 0;
			if key_up:
				motion.y = -JUMP;
		else:
			if motion.y < 0:
				state = 2;
			else:
				state = 3; 
			
	
	#State Machine
		match state:
			0:#Idle
				$Sprite.play("Idle");
			1:#Moving Along Ground
				$Sprite.play("Run");
			2:#Jumping
				$Sprite.play("Jump");
			3:#Falling
				$Sprite.play("Fall");
	
		motion = move_and_slide(motion, UP);