extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var player : CharacterBody3D = $CharacterBody3D
	$MainCamera.current = true
	# Check if player exists
		
	if player:
		
		var player_children: Array[Node] = player.get_children()
		var player_camera: Camera3D = null
		
		for child in player_children:
			print("[DEBUG] Child of player_children: ", child)
			if child is Camera3D:
				player_camera = child

		# Check if player camera exists or not
		if player_camera:
			player_camera.make_current()
			$MainCamera.clear_current(false)
			#$MainCamera.current = false
			print("Using Player Camera")
		else:
			$MainCamera.make_current()
			print("Player Camera3D not found.")
			print("[DEBUG] player_camera returns: ", player_camera)
	else:
		$MainCamera.make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
