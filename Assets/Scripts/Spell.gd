class Spell:
	
	#Variable for all spell
	var animation
	var icon
	var name
	var level
	var cooldown
	
	func _init(var name,var animation,var icon,var level, var cooldown):
		self.name = name
		self.animation = animation
		self.icon = icon
		self.level = level
		self.cooldown = cooldown
		
class Attack_Spell extends Spell:
	
	var damage
	var speed
	
	func _init(var name, var animation, var icon, var level,var cooldown, var damage, var speed):
		super(name, animation, icon, level, cooldown)
		self.damage = damage
		self.speed = speed
	
	func attack
	