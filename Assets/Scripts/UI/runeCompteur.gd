extends Control


func _update_compteur():
	$runeTypes/runeStats/runeStats/nb.text = ": " + str(player_data.nbRuneStats)
	$runeTypes/runeMajeure/runeMajeure/nb.text = ": " + str(player_data.nbRuneMajeure)
	$runeTypes/runeMoyenne/runeMoyenne/nb.text = ": " + str(player_data.nbRuneMoyenne)
	$runeTypes/runeMineure/runeMineure/nb.text = ": " + str(player_data.nbRuneMineure)