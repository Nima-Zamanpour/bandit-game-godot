extends Area2D
signal pull


var main : Node2D
var lock = false
var first_click = true 
var end_game = false
var prob_1 = 1

func set_prob_1(prob_1_):
	prob_1 = prob_1_
	
func _ready():
	main = get_parent()
	main = main.get_parent()
	
func _process(delta):
	lock = main.master_lock
	
	
func _input(event): # when you click
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			# main IF for arm functionality
		if $motor.clicked_inside_object(event) and not main.master_lock and not first_click and not end_game:
			main.click_times.append(Time.get_ticks_msec())
			$lever_sound.play()
			pull.emit()
			var next_try_timer = get_node("/root/Main/next_try_timer") #start next try button timer
			next_try_timer.start()
		if first_click:
			first_click = false


func _on_lever_timer_timeout():
	var tween = create_tween()
	tween.tween_property($lever, "rotation", deg_to_rad(-45), 1).set_trans(Tween.TRANS_BACK)

func _on_lock_timer_timeout():
	#main.master_lock = false
	$cash_Label.show_score(prob_1)
	$lock_timer.stop()

func _on_pull(): # when you click
	main.master_lock = true 
	var tween = create_tween() #animation
	tween.tween_property($lever, "rotation", -2*PI/3, 2).set_trans(Tween.TRANS_BACK) 
	$lever_timer.start()
	$lock_timer.start()
		
	var count_lebel = get_node("/root/Main/count_Label") # reduce trials
	count_lebel.reduce_one_trial()
	
func disable_arm():
	end_game = true
