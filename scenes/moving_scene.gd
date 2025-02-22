extends Node2D

var speed : int = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Drone.scale = Vector2(0.5,0.5)
	print(round($Drone.rotation_degrees))
	wiggle_drone()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Drone.position.x += speed * delta
	
	# bringig the drone back to the start
	if $Drone.position.x > 1000:
		$Drone.position.x = 0
		

func wiggle_drone():
	var tween = create_tween()
	tween.tween_property($Drone, "rotation_degrees", 85, 0.5).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property($Drone, "rotation_degrees", 100, 0.5).set_trans(Tween.TRANS_LINEAR)
	tween.tween_callback(wiggle_drone)  # Loop the wiggle
