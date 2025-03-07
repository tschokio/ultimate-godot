extends Node2D
class_name LevelParent


var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

var grenade_hit_distance: int = 200
var containersAndEntity: Array


func _ready():
	
	
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)
		containersAndEntity.append(container)
	for scout in get_tree().get_nodes_in_group("Scouts"):
		scout.connect("laser", _on_scout_laser)
	for entity in get_tree().get_nodes_in_group("Entity"):
		containersAndEntity.append(entity)

	#for object in containersAndEntity:
		#print(object.global_position)
		#print(containersAndEntity)
		
#func _on_grenade_explosion():
	#print('grenade exploded')

func _on_scout_laser(pos, direction):
	create_laser(pos,direction)
	
func _on_container_opened(pos, direction):
	print('on container opened')
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child', item)
	

func _process(_delta):
	pass
		

func _on_player_player_laser_shot_signal(pos, direction) -> void:
	create_laser(pos,direction)
	
func create_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)

func _on_player_player_grenade_shot_signal(pos, direction) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	grenade.connect("grenade_exploding", _grenade_exploding)
	$Projectiles.add_child(grenade)
	
func _grenade_exploding(position):
		print('grenade exploding from level')
		print(position)
		var distance: float = 0
		
		for object in containersAndEntity:
			distance = object.global_position.distance_to(position)
			if distance < grenade_hit_distance:
				print(object.name + " has been hit")
				object.hit()
			
		
		
	
