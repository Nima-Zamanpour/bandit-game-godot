extends Node2D

var clicked_arms = []
var total_cash_earned = 0


func _ready():
	$arm1/Area2D.set_prob_1(0.6)
	$arm2/Area2D.set_prob_1(0.5)
	$arm3/Area2D.set_prob_1(0.4)
	$popup.hide()
	


func add_arm_to_list(arm_name, cash):
	clicked_arms.append(str(arm_name))
	total_cash_earned += cash
	print(clicked_arms)
	print('$'+str(total_cash_earned)+' earned')


func  perform_endgame():
	$arm1/Area2D.disable_arm()
	$arm2/Area2D.disable_arm()
	$arm3/Area2D.disable_arm()
	$end_game_timer_go.start()
	$end_game_timer_come.start()
	
	


func _on_end_game_timer_come_timeout(): 
	$popup.show()
	var tween = create_tween()
	tween.tween_property($popup, "scale", Vector2(1,1), 1).set_trans(8)


func _on_end_game_timer_go_timeout():
	$explain_Label.hide()
	$count_Label.hide()
