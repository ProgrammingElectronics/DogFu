extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


@export var speed = 300.0

func _physics_process(delta):
	# Get input direction
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Set velocity based on direction
	velocity = direction * speed
	
	# Handle animations
	var animated_sprite = $AnimatedSprite2D
	
	if direction != Vector2.ZERO:
		# Character is moving, play walk animation
		animated_sprite.play("walk")
		
		# Flip sprite based on movement direction
		if direction.x != 0:
			animated_sprite.flip_h = direction.x < 0
	else:
		# Character is idle
		if animated_sprite.sprite_frames.has_animation("idle"):
			animated_sprite.play("idle")
		else:
			animated_sprite.stop()
		
		# Move the character
	move_and_slide()
