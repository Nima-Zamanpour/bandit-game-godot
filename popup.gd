extends Control

@onready var menu = $menu
@onready var slider = $HSlider
var selected_arm = 0
var confidence_report
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_menu_item_selected(index):
	selected_arm = index
	#print(menu.get_item_text(index))

func _on_h_slider_value_changed(value):
	confidence_report = value


func _on_button_pressed():
	menu.disabled = true
	slider.editable = false
	var selected_arm_text = menu.get_item_text(selected_arm)
	if confidence_report == null :
		confidence_report = 0
	print('The user chose '+ selected_arm_text + ' with ' + str(confidence_report*100/5) + '% confidence')


