extends Sprite2D

var first_click = true 
func _ready():
	pass
	
	
func _input(event): # when you click
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
 
		if first_click:
			first_click = false
			var tween = create_tween()
			tween.tween_property(self, "position", Vector2(600, 1000), 1).set_trans(Tween.TRANS_BACK)
