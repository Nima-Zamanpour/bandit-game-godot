extends Control


@onready var slider = $HSlider
var selected_arm = 0
var confidence_report
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_h_slider_value_changed(value):
	confidence_report = value


func _on_button_pressed():
	$Button.disabled = true
	$arm1.disabled = true
	$arm2.disabled = true
	$arm3.disabled = true
	slider.editable = false
	var selected_arm_text = str(selected_arm)
	if confidence_report == null :
		confidence_report = 0
	print('The user chose '+ selected_arm_text + ' with ' + str(confidence_report*100/5) + '% confidence')




func _on_arm_1_pressed():
	selected_arm = 1


func _on_arm_2_pressed():
	selected_arm = 2


func _on_arm_3_pressed():
	selected_arm = 3
