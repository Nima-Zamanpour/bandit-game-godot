extends Sprite2D

var originalPosition: Vector2
var minAmplitude: float = 0.0
var maxAmplitude: float = 5.0
var amplitude:float
var parentScript: Node2D

func _ready():
	parentScript = get_parent()
	originalPosition = position

func _process(_delta: float):
	
	amplitude = randf_range(minAmplitude, maxAmplitude)
	if parentScript.lock:
		var rand = randf_range(-100, 100)
		var Offset = Vector2(sin(rand) * amplitude,cos(rand) * amplitude)
		position = originalPosition + Offset
	else:
		position = originalPosition
	
func clicked_inside_object(event):
	var mouse_pos = event.position
	var area_size = get_texture().get_size()/1
	var area_pos = global_position 
	
	if mouse_pos.x >= area_pos.x and mouse_pos.x <= area_pos.x + area_size.x and mouse_pos.y >= area_pos.y and mouse_pos.y <= area_pos.y + area_size.y:
		return true
	else:
		return false
