extends LevelParent



func _on_gate_player_entered_gate(body: Variant) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)
