extends LevelParent

func _on_light_timer_timeout() -> void:
	var tween = create_tween()
	tween.set_parallel(false)
	tween.tween_property($Lights/DirectionalLight2D, "energy", 1.5, 1)
	tween.tween_property($Lights/DirectionalLight2D, "energy", 1, 1)


func _on_exit_gate_area_body_entered(_body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)
	TransitionLayer.change_scene("res://scenes/levels/outside.tscn")
