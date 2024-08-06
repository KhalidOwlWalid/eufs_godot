extends Node3D

var player_camera: Camera3D = null
		
# Called when the node enters the scene tree for the first time.
func _ready():
	var player : CharacterBody3D = $CharacterBody3D
	# Check if player exists
		
	if player:
		
		var player_children: Array[Node] = player.get_children()
		
		for child in player_children:
			print("[DEBUG] Child of player_children: ", child)
			if child is Camera3D:
				player_camera = child
			
		$MainCamera.make_current()
		# Check if player camera exists or not
		if player_camera:
			player_camera.make_current()
			#$MainCamera.current = false
			print("Using Player Camera")
		else:
			print("Player Camera3D not found.")
			print("[DEBUG] player_camera returns: ", player_camera)
	else:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_C:
			print("Changing camera view to CameraMain")
			$MainCamera.make_current()
		else:
			print("Changing camera to PlayerCamera")
			player_camera.make_current()
			
