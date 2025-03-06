extends ItemContainerParent

func hit():
	if opened == false:
		$LidSprite.hide()
		var position = $SpawnPositions/Marker2D.global_position
		open.emit(position, current_direction)
		opened = true
