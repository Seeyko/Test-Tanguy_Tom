extends Control

func _ready():
	runeCompteur._update_compteur()
	for button in get_tree().get_nodes_in_group("cases"):
		button.connect("pressed", self, "_some_button_pressed", [button])
	pass

func _some_button_pressed(button):
	if(button.access == true):
		if(button.buy()):
			var caseUnlock = unlock_case.unlock_system[button.name]
			var caseUnlockArrays
			if(caseUnlock != null):
				caseUnlockArrays = caseUnlock.split("/", true)
				for i in caseUnlockArrays:
					if(i != null):
						for accessibleButton in get_tree().get_nodes_in_group("cases"):
							if(accessibleButton.name == i):
								accessibleButton.setAccessible()
			$TextureRect/runeCompteur._update_compteur()
	else:
		#Le bouton n'est pas accessible
		print(" pas accessible ")