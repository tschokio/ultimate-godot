extends LevelParent

@export var outside_level_scene : PackedScene
func _ready():
	pass
		
func _process(_delta):
	pass


func _on_light_timer_timeout() -> void:
	var tween = create_tween()
	tween.set_parallel(false)
	tween.tween_property($Lights/DirectionalLight2D, "energy", 1.5, 1)
	tween.tween_property($Lights/DirectionalLight2D, "energy", 1, 1)


func _on_exit_gate_area_body_entered(_body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)
	#get_tree().change_scene_to_file("res://scenes/levels/outside.tscn")
	get_tree().change_scene_to_packed(outside_level_scene)
