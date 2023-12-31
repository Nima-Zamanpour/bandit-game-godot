extends Label

var original_pos
func _ready():
	original_pos = position
	hide()
# Called when the node enters the scene tree for the first time.
func generateNormalRandom(prob_1) -> float:
	var rand_number = randf_range(0.0, 1.0)
	if prob_1>rand_number:
		return 10
	else:
		return 0


func show_score(prob_1):
	$label_timer.start()
	show()
	var cash = generateNormalRandom(prob_1)
	var main = get_node("/root/Main") #add to arm
	main.add_arm_to_list(self.get_parent().get_parent().name, cash)
	
	text = '$' + str(cash)
	
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "position", original_pos+Vector2(0,-100), 3.0).set_trans(1)
	
	tween.tween_property(self, "modulate",  Color(0.3, 0.8, 0.3, 0), 3).set_trans(Tween.TRANS_LINEAR)
	
	modulate = Color(0.3, 0.8, 0.3, 1)
	position = original_pos
