extends Control


func _ready():
	

	if(player_data.spear == null):
		player_data.spear = "lance1_1"
		player_data.spear1_upgradeSelected = "lance1_1"
	$background/Spears/lance1.texture_normal = load("res://Assets/Textures/UI/Spear/" + player_data.spear1_upgradeSelected + ".png")
	for button in get_tree().get_nodes_in_group("Spear"):
		button.connect("pressed", self, "_some_button_pressed", [button])
		button.connect("mouse_entered", self, "_some_button_hover", [button])
		if(str(global._get_pngName_fromPath(button.texture_normal.resource_path)) == player_data.spear): 
			var texture = load("res://Assets/Textures/UI/Spear/selecteur_lance.png")
			button.texture_focused = texture
			button.grab_focus()
			$background/Desc/Name.clear()
			$background/Desc/Name.append_bbcode("[center]" + Spear_desc._getName(str(global._get_pngName_fromPath(button.texture_normal.resource_path))) + "[/center]")
			$background/Desc/Desc.clear()
			$background/Desc/Desc.append_bbcode("[center]" + Spear_desc._getDescription(str(global._get_pngName_fromPath(button.texture_normal.resource_path))) + "[/center]")
	pass
	


func _some_button_pressed(button):
	player_data.spear = str(global._get_pngName_fromPath(button.texture_normal.resource_path))
	print(player_data.spear)
	var texture = load("res://Assets/Textures/UI/Spear/selecteur_lance.png")	
	button.texture_focused = texture
	button.grab_focus()
func _some_button_hover(button):
	
	$background/Desc/Name.clear()
	$background/Desc/Name.append_bbcode("[center]" + Spear_desc._getName(str(global._get_pngName_fromPath(button.texture_normal.resource_path))) + "[/center]")
	$background/Desc/Desc.clear()
	$background/Desc/Desc.append_bbcode("[center]" + Spear_desc._getDescription(str(global._get_pngName_fromPath(button.texture_normal.resource_path))) + "[/center]")
	

func _on_Upgrade1_button_down():
	var textureName = global._get_pngName_fromPath($background/Spears/lance1.texture_normal.resource_path)
	textureName = upgrade_spear(textureName)
	$background/Spears/lance1.texture_normal = load("res://Assets/Textures/UI/Spear/" + textureName + ".png")
	player_data.spear1_upgradeSelected = textureName

func upgrade_spear(var name):
	var number = int(name.right(7))
	if(number == 3):
		number = 1
	else:
		number = number + 1


	return "lance1_" + str(number)
