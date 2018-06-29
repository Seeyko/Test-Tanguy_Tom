extends Node

var spear_name = {
	"lance1_1" : "Pelle de bronse",
	"lance1_2" : "Pelle d'argent",
	"lance1_3" : "Pelle d'or",
	"lance2": "Vrai lance",
	"lance3": "Lance de lancier",
	"lance4" : "Lance stylé",
	"lance5" : "Lance stylé de fou",
}

var spear_degats = {
	"lance1_1" : 5,
	"lance1_2" : 10,
	"lance1_3" : 15,
	"lance2": 20,
	"lance3": 25,
	"lance4" : 30,
	"lance5" : 50,
}

var spear_description = {
	"lance1_1" : "Belle outil de paysan mais pas fou pour la baston.\nDegats : " + str(spear_degats.lance1_1),
	"lance1_2" : "L'argent y'as que ça de vrai.\nDegats : " + str(spear_degats.lance1_2),
	"lance1_3" : "Plus riche que les princes de la ville, cette pelle est faite pour vous.\nDegats : " + str(spear_degats.lance1_3),
	"lance2" : "Votre premier lance.\nDegats : " + str(spear_degats.lance2),
	"lance3" : "Une vrai lance de samourai.\nDegats : " + str(spear_degats.lance3),
	"lance4" : "Voila enfin une vraie arme.\nDegats : " + str(spear_degats.lance4),
	"lance5" : "Les ennemis tremble enfin devant vous.\nDegats : " + str(spear_degats.lance5),
}

func _getDescription(var key):
	return spear_description[key]

func _getName(var key):
	return spear_name[key]
	
func _getDegats(var key):
	return spear_degats[key]
	
