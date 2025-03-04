extends Area2D

var rotation_speed: int = 3
var available_options = ['laser','laser','laser','laser', 'grenade', 'health']
var type = available_options[randi()%len(available_options)]

func _process(delta):
	rotation += rotation_speed * delta
	
func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0.3,0.3,0.9,0.85)
	elif type == 'grenade':
		$Sprite2D.modulate = Color(0.9,0.3,0.3,0.85)
	elif type == 'health':
		$Sprite2D.modulate = Color(0.3,0.9,0.3,0.85)

func _on_body_entered(body: Node2D) -> void:
	body.add_item(type)
	queue_free()
