extends TextureProgress

const IMG_POSITION = Vector2(5,6)

var spell_name = null
var spell_img = Image()
var timer = null

func _ready():
	load_texture()
	value = 100
	timer = Timer.new()
	timer.wait_time = TIME_BETWEEN_DASH
	timer.one_shot = true
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	pass

func _process(delta):

	pass

func load_texture():
	spell_name = Player.bigSpell
	spell_img.load("res://Assets/Textures/UI/", texture_name)
	texture_under = spell_img
	texture_progress = spell_img
	
func on_timeout_complete():
	can_dash = true
	print("can dash")