extends Control


func _ready():
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_EditButton_pressed():
	Transition.fade_to("res://Assets/Scenes/Spells/Spell_Selection2.tscn")