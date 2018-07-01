extends KinematicBody2D

export var damage = 0

func _ready():
	pass
	
func _process(delta):
	update_pos()
#
func update_pos():
	self.global_rotation = (get_global_mouse_position() - self.global_position).normalized().angle() + deg2rad(90)
	