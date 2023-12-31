extends Label

var trials_left = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(trials_left) + ' trails left'

func reduce_one_trial():
	trials_left -= 1 
	if trials_left == 0:
		var main = self.get_parent()
		main.perform_endgame()
		modulate = Color(1, 0, 0, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if trials_left>0:
		text = str(trials_left) + ' trails left'
	else:
		text = 'No trials left'
