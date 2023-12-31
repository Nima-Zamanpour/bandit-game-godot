extends CollisionShape2D


func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = event.position

		if collide_point(mouse_pos):
			print("Click inside Sprite2D")
