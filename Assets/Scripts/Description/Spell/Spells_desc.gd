extends Node


var spell_name = {
	"PrincipalFire"	: "Boule de feu",
	"PrincipalWind" : "Shuriken",
	"PrincipalThunder" : "Chidori",
	"PrincipalWater" : "Hydrocanon",
	"SecondaryFire" : "Test",
	"SecondaryWind" : "Test",
	"SecondaryThunder" : "Test",
	"SecondaryWater" : "Test",
	"PassiveFire" : "Test",
	"PassiveWind" : "Test",
	"PassiveThunder" : "Test",
	"PassiveWater" : "Test",
}

var spell_degats = {
	"PrincipalFire"	: 50,
	"PrincipalWind" : 20,
	"PrincipalThunder" : 5,
	"PrincipalWater" : 80,
	"SecondaryFire" : 10,
	"SecondaryWind" : 10,
	"SecondaryThunder" : 10,
	"SecondaryWater" : 10,
	"PassiveFire" : 10,
	"PassiveWind" : 10,
	"PassiveThunder" : 10,
	"PassiveWater" : 10,
}

var spell_couts = {
	"PrincipalFire"	: 50,
	"PrincipalWind" : 20,
	"PrincipalThunder" : 5,
	"PrincipalWater" : 80,
	"SecondaryFire" : 10,
	"SecondaryWind" : 10,
	"SecondaryThunder" : 10,
	"SecondaryWater" : 10,
	"PassiveFire" : 10,
	"PassiveWind" : 10,
	"PassiveThunder" : 10,
	"PassiveWater" : 10,
	
}

var spell_cooldown = {
	"PrincipalFire"	: 5,
	"PrincipalWind" : 0.5,
	"PrincipalThunder" : 5,
	"PrincipalWater" : 20,
	"SecondaryFire" : 10,
	"SecondaryWind" : 10,
	"SecondaryThunder" : 10,
	"SecondaryWater" : 10,
	"PassiveFire" : 10,
	"PassiveWind" : 10,
	"PassiveThunder" : 10,
	"PassiveWater" : 10,
	
}

var spell_description = {
	"PrincipalFire"	: "Lance une boule de feu qui inflige des dégats sur les ennemis.\nDégats : " + str(spell_degats.PrincipalFire) + "\nCoûts : " + str(spell_couts.PrincipalFire) + " mana\nCooldown : " + str(spell_cooldown.PrincipalFire) + " secondes",
	"PrincipalWind" : "Lance un shuriken acéré sur les ennemis, petit mais puissant.\nDégats : 20\n Coûts : 0 mana\nCooldown : 0,5 secondes",
	"PrincipalThunder" : "Vous serez la réincartion de Dieux et ses milles oiseaux.\nDégats : 10/secondes\n Coûts : 10/secondes mana\nCooldown : 0 secondes",
	"PrincipalWater" : "Tout comme Tortank et son hydrocanon.\nDégats : 80\n Coûts : 200 mana\nCooldown : 7 secondes",
	"SecondaryFire" : "Lorem Ipsum Lorem Ipsum Lorem Ipsum .\nDégats : 20\n Coûts : 0 mana\nCooldown : 0,5 secondes",
	"SecondaryWind" : "Lorem Ipsum Lorem Ipsum Lorem Ipsum .\nDégats : 20\n Coûts : 0 mana\nCooldown : 0,5 secondes",
	"SecondaryThunder" : "Lorem Ipsum Lorem Ipsum Lorem Ipsum .\nDégats : 20\n Coûts : 0 mana\nCooldown : 0,5 secondes",
	"SecondaryWater" : "Lorem Ipsum Lorem Ipsum Lorem Ipsum .\nDégats : 20\n Coûts : 0 mana\nCooldown : 0,5 secondes",
	"PassiveFire" : "Lorem Ipsum Lorem Ipsum Lorem Ipsum .\nDégats : 20\n Coûts : 0 mana\nCooldown : 0,5 secondes",
	"PassiveWind" : "Lorem Ipsum Lorem Ipsum Lorem Ipsum .\nDégats : 20\n Coûts : 0 mana\nCooldown : 0,5 secondes",
	"PassiveThunder" : "Lorem Ipsum Lorem Ipsum Lorem Ipsum .\nDégats : 20\n Coûts : 0 mana\nCooldown : 0,5 secondes",
	"PassiveWater" : "Lorem Ipsum Lorem Ipsum Lorem Ipsum .\nDégats : 20\n Coûts : 0 mana\nCooldown : 0,5 secondes",
}

func _getDescription(var key):
	return spell_description[key]

func _getName(var key):
	return spell_name[key]

func _getCooldown(var key):
	return spell_cooldown[key]
	
func _getDegats(var key):
	return spell_degats[key]
	
func _getCouts(var key):
	return spell_couts[key]
