extends CharacterBody2D

signal player_laser_shot_signal(pos, direction)
signal player_grenade_shot_signal(pos, direction)

var can_laser: bool = true
var can_grenade: bool = true
# Called when the node enters the scene tree for the first time.

@export var max_speed: int = 500
var speed: int = max_speed

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	# rotate
	look_at(get_global_mouse_position())
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	# laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]

		# trigger the laser
		$LaserShotParticle.restart()
		can_laser = false
		$LaserTimer.start()
		
		# emit the position we selected
		player_laser_shot_signal.emit(selected_laser.global_position, player_direction)
		
	if Input.is_action_pressed("second action") and can_grenade:
		var grenade_markers = $GrenadeStartPositions.get_children()
		var selected_grenades = grenade_markers[randi() % grenade_markers.size()]
		can_grenade = false
		$GrenadeTimer.start()
		# emit the position that was selected 
		player_grenade_shot_signal.emit(selected_grenades.global_position, player_direction)


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true
