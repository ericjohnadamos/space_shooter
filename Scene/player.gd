extends CharacterBody2D

@export var speed := 600
var can_shoot: bool = false

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# shooting mechanic
	if Input.is_action_just_pressed("shoot"):
		laser.emit($LaserStartPosition.global_position)
		can_shoot = false
		$ShootTimer.start()

func _on_shoot_timer_timeout() -> void:
	can_shoot = true
