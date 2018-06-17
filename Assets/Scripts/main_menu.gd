extends Control

	
func _on_START_button_down():
	Transition.fade_to("res://Assets/Scenes/World1.tscn")


func _on_OPTION_button_down():
	Transition.fade_to("res://Assets/Scenes/level_selector.tscn")

func _on_QUIT_button_down():
	get_tree().quit()