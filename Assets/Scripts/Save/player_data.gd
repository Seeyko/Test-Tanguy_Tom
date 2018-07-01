extends Node

#STATS
#--Life
var currentHealth
var maxHealth 
var currentMana
var maxMana

#LEVEL
var currentLvl
#Position a stocker de la ou le joueur
var pos_onLvlSelector = Vector2()

#SPELL
#--Selected Spell
var Principal
var Secondary
var Passive

#Weapon
#La lance selectionné
var spear
#Les skin de lance selectionné
var spear1_upgradeSelected
var spear2_upgradeSelected
var spear3_upgradeSelected
var spear4_upgradeSelected
var spear5_upgradeSelected

#RUNES
var nbRuneMajeure
var nbRuneMoyenne
var nbRuneMineure
var nbRuneStats
enum RUNETYPES{runeMajeure,runeMoyenne,runeMineure,runeStats}

#WEALTH
var argent

func _ready():
	nbRuneMajeure = 10
	nbRuneMoyenne = 10
	nbRuneMineure = 10
	nbRuneStats = 10

#Function pour retourner le nombre de runes en fonction du type de rune passé en argument
func get_player_nbRunes(var runeType):
	if(runeType == runeMajeure):
		return nbRuneMajeure
	if(runeType == runeMoyenne):
		return nbRuneMoyenne
	if(runeType == runeMineure):
		return nbRuneMineure
	if(runeType == runeStats):
		return nbRuneStats

#Function pour le nombre de runes en fonction du type de rune passé en argument
func set_nbRunes(var price, var runeType, var plus_minus):
	if(plus_minus):
		if(runeType == runeMajeure):
			nbRuneMajeure = nbRuneMajeure + price
		if(runeType == runeMoyenne):
			nbRuneMoyenne = nbRuneMoyenne + price
		if(runeType == runeMineure):
			nbRuneMineure = nbRuneMineure + price
		if(runeType == runeStats):
			nbRuneStats = nbRuneStats + price
	else:
		if(runeType == runeMajeure):
			nbRuneMajeure = nbRuneMajeure - price
		if(runeType == runeMoyenne):
			nbRuneMoyenne = nbRuneMoyenne - price
		if(runeType == runeMineure):
			nbRuneMineure = nbRuneMineure - price
		if(runeType == runeStats):
			nbRuneStats = nbRuneStats - price
	
##------Save DATA-------

func save_game():
    var save_dict = {
	}

    return save_dict

#func save_spell():
#
#	var spells = {
#		"big_spell" : big_spell,
#		"spell_one" : spell_one,
#		"spell_two" : spell_two,
#		"unlock_spell_principal" : unlock_spell_principal,
#		"unlock_spell_secondary" : unlock_spell_secondary,
#	}
#	return spells
#
#func save_stats():
#
#	var stats = {
#		"current_health" : currentHealth,
#        "max_health" : maxHealth,
#		"current_energy" : currentEnergy,
#		"max_energy" : maxEnergy,
#	}
#	return stats
#
#func save_progression():
#
#	var progress = {
#        "pos_x" : Player.position.x, 
#        "pos_y" : Player.position.y,
#		"posLvl_x" : pos_onLvlSelector.x,
#		"posLvl_y" : pos_onLvlSelector.y,
#		"lvl_unlock" : lvl_unlock,
#        "currentLvl" : currentLvl,
#	}
#
#	return progress
#
#func save_playerData():
#	var save_game = File.new()
#	save_game.open("res://savegame.save", File.WRITE)
#
#	var playerdata = save_game()
#	save_game.store_line(to_json(playerdata))
#	print("Game saved : " + str(playerdata))
#	save_game.close()
#
#func create_save():
#
#	Player.position.x = 600
#	Player.position.y = 64
#	pos_onLvlSelector = Vector2(600,64)
#	currentHealth = 100
#	maxHealth = 100
#	currentEnergy = 100
#	currentHealth = 100
#	currentLvl = 1
#	lvl_unlock = { "Level1": 1, }
#
#	save_playerData()
#
#func load_game():
#	var save_game = File.new()
#	if not save_game.file_exists("res://savegame.save"):
#		create_save()
#
#	# We need to revert the game state so we're not cloning objects during loading. This will vary wildly depending on the needs of a project, so take care with this step.
#	# For our example, we will accomplish this by deleting savable objects.
#
#	# Load the file line by line and process that dictionary to restore the object it represents
#	save_game.open("res://savegame.save", File.READ)
#	var current_line = parse_json(save_game.get_line())
#	# First we need to create the object and add it to the tree and set its position.
#	Player.position.x = current_line["pos_x"]
#	Player.position.y = current_line["pos_y"]
#	pos_onLvlSelector.x = current_line["posLvl_x"]
#	pos_onLvlSelector.y = current_line["posLvl_y"]
#	currentLvl = current_line["currentLvl"]
#	maxHealth = current_line["max_health"]
#	currentHealth = current_line["current_health"]
#	big_spell = current_line["big_spell"]
#	spell_one = current_line["spell_one"]
#
#	save_game.close()
