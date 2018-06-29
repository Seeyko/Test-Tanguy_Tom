extends Node

var current_scene = null

var next_level_resource = load("res://Assets/Scenes/hoveringMenu.tscn")
var next_level = next_level_resource.instance()

func _ready():
		#player_data.load_game()
		var root = get_tree().get_root()
		current_scene = root.get_child( root.get_child_count() -1 )

func _physics_process(delta):
	if next_level.is_inside_tree():
		if Input.is_action_just_pressed("ui_cancel"):
			get_parent().remove_child(next_level)
			pass
	else:
		if Input.is_action_just_pressed("ui_cancel"):
			get_parent().add_child(next_level)
			pass

func goto_scene(path):

    # This function will usually be called from a signal callback,
    # or some other function from the running scene.
    # Deleting the current scene at this point might be
    # a bad idea, because it may be inside of a callback or function of it.
    # The worst case will be a crash or unexpected behavior.

    # The way around this is deferring the load to a later time, when
    # it is ensured that no code from the current scene is running:

    call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path):

    # Immediately free the current scene,
    # there is no risk here.
    current_scene.free()

    # Load new scene
    var s = ResourceLoader.load(path)

    # Instance the new scene
    current_scene = s.instance()

    # Add it to the active scene, as child of root
    get_tree().get_root().add_child(current_scene)

    # optional, to make it compatible with the SceneTree.change_scene() API
    get_tree().set_current_scene( current_scene )
	
func _get_pngName_fromPath(var path):
	var textArray = path.split("/", true)
	var pngArray = textArray[textArray.size()-1].split(".", true)

	return pngArray[0]