extends Node3D

@export var speed: float = 5.0
var car_direction: Vector3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Car spawned in scene!")
	print(get_node("CharacterBody3D/PlayerCamera"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if car_direction != Vector3.ZERO:
		var movement = car_direction.normalized() * speed * delta
		position += movement
	
func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_W:
			car_direction.x = 1
		if event.keycode == KEY_A:
			car_direction.z = -1
		if event.keycode == KEY_D:
			car_direction.z = 1
		if event.keycode == KEY_S:
			car_direction.x -= 1
	else:
		car_direction = Vector3.ZERO
