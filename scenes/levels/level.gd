extends Node2D

var test_array: Array[String] = ["Test", "Hello", "Stuff"]

func _ready():
	print('level node is ready')
	$Logo.rotation_degrees = 180
	
	for i in test_array:
		print(i)

	
func _process(delta):
	$Logo.rotation_degrees += 60 * delta
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
		
	# exercise
	
	if $Logo.visible == true:
		await try_wait()
		$Logo.visible = false
	else:
		await try_wait()
		$Logo.visible = true
		
func try_wait():
	await get_tree().create_timer(0.2).timeout
	
		
		
func test_function():
	print("this is a test function")
