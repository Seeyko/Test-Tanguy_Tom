extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	for button in get_tree().get_nodes_in_group("Spells"):
		button.connect("pressed", self, "_some_button_pressed", [button])
		button.connect("mouse_entered", self, "_some_button_hover", [button])
		button.connect("mouse_exited", self, "_some_button_exit_mouse", [button])
	pass

func _process(delta):
	
	pass


func _some_button_pressed(button):
	var texture = load("res://Assets/Textures/UI/Spells/"+button.name+button.get_parent().name + ".png")
	get_node("background/Selected_Spell/UI/"+ button.name).texture = texture
	
	
func _some_button_hover(button):
	var texture = load("res://Assets/Textures/UI/Spells/bigselecteur.png")
	button.texture_focused = texture
	button.grab_focus()
	$background/Desc/Name.clear()
	$background/Desc/Name.append_bbcode("[center]" + Spells_desc._getName(button.name + button.get_parent().name) + "[/center]")
	$background/Desc/Desc.clear()
	$background/Desc/Desc.append_bbcode("[center]" + Spells_desc._getDescription(button.name + button.get_parent().name) + "[/center]")
	
func _some_button_exit_mouse(button):
	button.release_focus()

func _on_Back_pressed():
	$background/Selected_Spell._save_texture()
	Transition.fade_to("res://Assets/Scenes/playerMenu.tscn")
