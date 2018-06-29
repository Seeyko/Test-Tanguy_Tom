extends KinematicBody2D

#Movements
#--Moving constant for zqsd
const ACCELERATION = 20
const GRAVITY = 30
const MAX_SPEED = 200
const JUMP_HEIGHT = -700
const UP = Vector2(0, -1)

#--Moving variable
var motion = Vector2()
var moving_scene = false


var right_keyPress = false
var left_keyPress = false
var countdwon_leftDash = 0
var countdwon_rightDash = 0
var have_input = false

#--Dash
const DASH_TIME = 0.35
const DASH_SPEED = 80
const TIME_BETWEEN_DASH = 2
var dash_acc = 0 

var can_dash = true
var is_dashing = false
var dash_isFinish = true
var side_toDash

var dash_timer = null

#STATS
#--Life
var currentHealth
var maxHealth
var currentEnergy
var maxEnergy

#Level position
var maxLvl 
var currentLvl  
var pos_onLvlSelector = Vector2()

var ui_exist = false

var anim
func _ready():
	anim = get_parent().get_node("animation")
	anim.play("idle")
	moving_scene = true
	#create the dash timer
	dash_timer = Timer.new()
	dash_timer.wait_time = TIME_BETWEEN_DASH
	dash_timer.one_shot = true
	dash_timer.connect("timeout", self, "on_timeout_complete")
	add_child(dash_timer)
	
func _physics_process(delta):
	
	if(moving_scene == true):
		#check_UI()
		
		#make the camera of the player the current camera for the scene
		#$followingCam.make_current()
				
		#Activate the dash
		if not dash_isFinish:

			dash(delta, side_toDash)
	
		#Gestion des mouvements 
		# JUMP
		if(is_on_floor()):
			if(Input.is_action_pressed("ui_up")):
				print("jump")
				motion.y = JUMP_HEIGHT
				have_input = true
		else:
			#motion.y += GRAVITY	
			pass
		
		#Si le joueur n'est pas entrain de dash
		if dash_isFinish:
			
			#On regarde si il essaye de dash
			check_forDash(delta)
			
			if(Input.is_action_pressed("ui_left")):
				motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
				
				if(not anim.is_playing()):
					anim.play("run (copy)")
				#get_parent().get_child("character sprite").get_child("animation").play("run (copy)")
				have_input = true
				
			if(Input.is_action_pressed("ui_right")):
				motion.x = min(motion.x+ACCELERATION, MAX_SPEED)

				
				if(not anim.is_playing()):
					anim.play("run (copy)")
				have_input = true
			
			#Si le joueur n'as pas appuyé sur une seule touche
			#on fait un lerp (linear interpolation) pour faire une fin de mouvement fluide
			if not have_input:
				motion.x = lerp(motion.x, 0, 0.2)
				anim.play("idle")
			
			move_and_slide(motion, UP)
			have_input = false


#Fonction gérant le signal qui est émit lorsque le timer du dash est a 0
func on_timeout_complete():
	can_dash = true
	print("can dash")
	
#Fonction qui vérifie si le joueur veut dash
func check_forDash(delta):
	
	if Input.is_action_just_pressed("ui_left"):
		if left_keyPress:
			if(countdwon_leftDash <= DASH_TIME) and can_dash:
				side_toDash = true
				dash_timer.start()
				is_dashing = true
				print("start dash")
				can_dash = false
				dash_isFinish = false
				left_keyPress = false
				
		countdwon_leftDash = 0
		left_keyPress = true
				
	elif Input.is_action_just_pressed("ui_right"):
		if right_keyPress:
			if(countdwon_rightDash <= DASH_TIME) and can_dash:
				side_toDash = false
				dash_timer.start()
				is_dashing = true
				print("start dash")
				can_dash = false
				dash_isFinish = false
				right_keyPress = false
				
				#$Sprite.flip_h = false
				
		countdwon_rightDash = 0
		right_keyPress = true
	
	countdwon_leftDash += delta
	countdwon_rightDash += delta
	
#Fonction effectuant un dash
func dash(delta, var side):
		
	dash_acc += delta
	if is_dashing:
		#Setting the dash side
		if(side):
			motion.x -= dash_acc + DASH_SPEED
			#$Sprite.flip_h = true
			
		else:
			motion.x += dash_acc + DASH_SPEED
			
			#$Sprite.flip_h = false
			
		if dash_acc >= DASH_TIME:
			print("end dash")
			is_dashing = false
	if dash_acc >= (DASH_TIME + 0.05):
		
		motion.x = lerp(motion.x, 0, 0.7)
		dash_acc = 0
		dash_isFinish = true
	if is_on_floor():
		
		#$Sprite.play("slide")
		pass	
	else:
		
		#$Sprite.play("dash")
		pass
	move_and_slide(motion, UP)

#----UI------
func check_UI():
	if(!ui_exist):
		create_ui()
	else:
		pass

func create_ui():
	var UI_res = load("res://Assets/Scenes/PlayerUI.tscn")
	var UI = UI_res.instance()
	add_child(UI)