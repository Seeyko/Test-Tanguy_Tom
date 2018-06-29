extends Control

func _update_compteur():
	$runeTypes/runeStats/HBoxContainer/Label.text = ": " + str(player_data.nbRuneStats)
	$runeTypes/runeMajeure/HBoxContainer/Label.text = ": " + str(player_data.nbRuneMajeure)
	$runeTypes/runeMoyenne/HBoxContainer/Label.text = ": " + str(player_data.nbRuneMoyenne)
	$runeTypes/runeMineure/HBoxContainer/Label.text = ": " + str(player_data.nbRuneMineure)