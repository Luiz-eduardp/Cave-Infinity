extends Node2D
onready var felpudo = get_node("Felpudo")
onready var timeToReplay = get_node("TimeToReplay")
onready var label = get_node("Node2D/Control/Label")
var pontos = 0 
var estado = 1
const SAVE_FILE_PATH = "user://savedata.save"
const JOGANDO = 1
const PERDENDO = 2
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func pontuar():
	pontos += 1
	label.set_text(str(pontos))
	get_node("SomScore").play()

func kill():
	felpudo.apply_impulse(Vector2(0,0), Vector2(-1000,0))
	get_node("backanim").stop()
	estado = PERDENDO
	timeToReplay.start()
	get_node("SomHit").play()
func _on_TimeToReplay_timeout():
	get_tree().reload_current_scene()
