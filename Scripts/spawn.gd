extends Node3D

var spawn_rate = 0.0
var spawn_show = 2.0
var randomr = 0.0
var random_x = 0.0
var random_y = 0.0
const enemyPath = preload("res://Scenes/enemy.tscn")

func _ready():
	set_process(true)
	pass 

func _process(delta):
	spawn_rate += delta
	if spawn_rate > spawn_show:
		spawn_rate = 0.0
		var enemySpawn = enemyPath.instantiate()
		enemySpawn.set_name("enenmy(Clone)")
		get_node(".").add_child(enemySpawn)
		randomr = RandomNumberGenerator.new()
		random_x = randomr.randf_range(-1.8,1.8)
		random_y = randomr.randf_range(0,1.8)
		enemySpawn.transform.origin = Vector3(random_x,random_y,-9)
	pass
