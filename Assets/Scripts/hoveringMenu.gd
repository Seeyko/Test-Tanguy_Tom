extends Control


func _on_MainMenu_button_down():
	get_parent().remove_child(self)
	Transition.fade_to("res://Assets/Scenes/main_menu.tscn")
	

func _on_levelSelector_button_down():
	get_parent().remove_child(self)
	Transition.fade_to("res://Assets/Scenes/level_selector.tscn")


func _on_saveGame_button_down():
	#joueur.save_playerData()
	pass
func _on_Quit_button_down():
	get_tree().quit()
