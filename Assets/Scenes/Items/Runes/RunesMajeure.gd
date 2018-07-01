extends Node2D

export(Texture) var texture

func _ready():
	$AnimationPlayer.play("anim")
	pass



func _on_Area2D_body_entered(body):
	print(body.name)
	player_data.set_nbRunes(1, enumRunes.runeMajeure, true)
	get_parent().get_node("joueur").get_node("Player")._update_compteur()
	$AnimationPlayer.play("collect")

	
func end_collect():
	self.queue_free()

	
	
