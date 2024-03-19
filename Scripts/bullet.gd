extends CharacterBody3D

const SPEED = 1.0
var wait_time = 0.0
var destroy_time = 0.3

func _physics_process(delta):
	translate(Vector3(0,0, delta + SPEED))
	await get_tree().create_timer(destroy_time).timeout
	queue_free()
	pass


func _on_area_3d_area_entered(area):
	if area == get_tree().get_first_node_in_group("Enemy"):
		queue_free()
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body == get_tree().get_first_node_in_group("Enemy"):
		queue_free()
	pass # Replace with function body.
