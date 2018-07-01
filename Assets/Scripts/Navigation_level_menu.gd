extends Navigation2D

# Member variables

const SPEED = 200.0
const LEVEL_TEXT = "Level : "
const file_to_save = "res://Assets/Configs/configLevel.cfg"    

var begin = Vector2()
var end = Vector2()
var path = []
var press = false
                             

var pos = ""



func _ready():
	
	pos = player_data.currentLvl
	load_level_selector()
	changeLevel_inConfig_andScreen()                    
	
func load_level_selector():
	

	$Player.position = Vector2(player_data.pos_onLvlSelector.x, player_data.pos_onLvlSelector.y)
	
func changeLevel_inConfig_andScreen():
	$Label.text = LEVEL_TEXT + str(player_data.currentLvl)
	 
func changePos_inConfig_andScreen():
	
	player_data.pos_onLvlSelector.x = $Player.position.x
	player_data.pos_onLvlSelector.y = $Player.position.y  
	
func _process(delta):
	
	if(press == false):
		for button in get_tree().get_nodes_in_group("button"):
	    	button.connect("pressed", self, "_some_button_pressed", [button])
	if path.size() > 1:
		var to_walk = delta * SPEED
		while to_walk > 0 and path.size() >= 2:
			var pfrom = path[path.size() - 1]
			var pto = path[path.size() - 2]
			var d = pfrom.distance_to(pto)
			if d <= to_walk:
				path.remove(path.size() - 1)
				to_walk -= d
			else:
				path[path.size() - 1] = pfrom.linear_interpolate(pto, to_walk/d)
				to_walk = 0
		
		var atpos = path[path.size() - 1]
		$Player.position = atpos

		
		if path.size() < 2:
			print("arrive a ", player_data.currentLvl)
			changePos_inConfig_andScreen()
			$Label.text = (LEVEL_TEXT + str(player_data.currentLvl))
			path = []
			press = false
			set_process(false)
	else:
		set_process(false)


func _update_path():
	var p = get_simple_path(begin, end, true)
	path = Array(p) # PoolVector2Array too complex to use, convert to regular array
	path.invert()
	
	set_process(true)

func _some_button_pressed(button):
	press = true
	pos = button.name
	player_data.currentLvl = int(button.name)
	changeLevel_inConfig_andScreen() 
	begin = $Player.position
	# Mouse to local navigation coordinates
	end = button.get_rect().position - position
	_update_path()
	