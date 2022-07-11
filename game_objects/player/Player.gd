extends KinematicBody2D


# Declare member variables here.
# var a = 2
# var b = "text"
var velocity := Vector2(0, 0)
var jump := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	
	velocity.x = 0
	
	# fall if no floor, reset y velocity otherwise
	match is_on_floor():
		true:
			jump = true
			position.y += .1
			velocity.y = 0
		false:
			velocity.y += 10
	
	if is_on_ceiling():
		velocity.y = 0
		position.y += 1
	
	if Input.is_action_just_pressed("player_move_jump") and jump:
		velocity.y -= 600
		jump = false
	if Input.is_action_pressed("player_move_left"):
		velocity.x = -300
	if Input.is_action_pressed("player_move_right"):
		velocity.x = 300
	
	move_and_slide(velocity, Vector2(0, -1))
