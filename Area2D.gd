extends Area2D

signal pull

var lock = false # locks the lever from being issued while moving
var first_click = true 
var end_game = false
var prob_1 = 1

func set_prob_1(prob_1_):
	prob_1 = prob_1_
	
func _ready():
	pass
	
	
	
func _input(event): # when you click
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():

		if $motor.clicked_inside_object(event) and not lock and not first_click and not end_game:
			$lever_sound.play()
			pull.emit()
		if first_click:
			first_click = false


func _on_lever_timer_timeout():
	var tween = create_tween()
	tween.tween_property($lever, "rotation", deg_to_rad(-45), 1).set_trans(Tween.TRANS_BACK  )

func _on_lock_timer_timeout():
	lock = false 
	$cash_Label.show_score(prob_1)
	$lock_timer.stop()

func _on_pull(): # when you click
	lock = true
	var tween = create_tween() #animation
	tween.tween_property($lever, "rotation", -2*PI/3, 1).set_trans(Tween.TRANS_BACK ) 
	$lever_timer.start()
	$lock_timer.start()
		
	var count_lebel = get_node("/root/Main/count_Label") # reduce trials
	count_lebel.reduce_one_trial()
	
func disable_arm():
	end_game = true
