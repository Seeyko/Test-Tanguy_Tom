extends TextureButton

export var access = false
export var buy = false
export var price = 0
export var case_name = ""
export var description = ""

enum RUNETYPES{runeMajeure,runeMoyenne,runeMineure,runeStats}
export(RUNETYPES) var runeType 

func _ready():
	if(access):
		self.texture_normal = load("res://Assets/Textures/UI/bouton.png")
	if(buy):
		self.texture_normal = load("res://Assets/Textures/UI/boutonsortie.png")
	pass
	
func buy():
	var player_nbRunes = player_data.get_player_nbRunes(runeType)
	if(player_nbRunes >= price):
		buy = true
		player_data.set_nbRunes(self.price, runeType, false)
		self.texture_normal = load("res://Assets/Textures/UI/boutonsortie.png")
		print("Vous avez acheté " + self.case_name)
		return true
	else:
		print("vous n'avez pas assez de sous")
		return false
		
func setAccessible():
	access = true
	self.texture_normal = load("res://Assets/Textures/UI/bouton.png")
	print(self.case_name + " est maintenant accessible")
