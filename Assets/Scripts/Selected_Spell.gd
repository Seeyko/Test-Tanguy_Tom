extends Control


func _ready():
	if(player_data.Principal != null):
		$UI/Principal.texture = load("res://Assets/Textures/UI/Spells/" + str(player_data.Principal) + ".png")
	if(player_data.Secondary != null):
		$UI/Secondary.texture= load("res://Assets/Textures/UI/Spells/" + str(player_data.Secondary) + ".png")
	if(player_data.Passive != null):
		$UI/Passive.texture = load("res://Assets/Textures/UI/Spells/" + str(player_data.Passive) + ".png")
	pass

func _save_texture():
	if($UI/Principal.texture != null):
		player_data.Principal =  global._get_pngName_fromPath($UI/Principal.texture.resource_path)
	if($UI/Secondary.texture != null):
		player_data.Secondary = global._get_pngName_fromPath($UI/Secondary.texture.resource_path)
	if($UI/Passive.texture != null):
		player_data.Passive = global._get_pngName_fromPath($UI/Passive.texture.resource_path)
