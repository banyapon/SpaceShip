extends CharacterBody3D
var speed = 5.0

func _ready():
	set_process(true)
	pass

func _physics_process(delta):
	translate(Vector3(0,0,delta * speed))
	pass

func destroy():
	queue_free()
	pass


func _on_area_3d_area_entered(area):
	if area == get_tree().get_first_node_in_group("Bullet"):
		Global.getPoint()
		queue_free()
	
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body == get_tree().get_first_node_in_group("Bullet"):
		Global.getPoint()
		queue_free()
	pass # Replace with function body.
