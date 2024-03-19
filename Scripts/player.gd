extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var isAttackePressed = false

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
const bulletPath = preload("res://Scenes/bullet.tscn")

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_accept"):
		if isAttackePressed == false:
			fire()
			isAttackePressed = true
			await get_tree().create_timer(0.3).timeout
			isAttackePressed = false

	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, input_dir.y,0 )).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = -direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	pass
	
func fire():
	var bullet = bulletPath.instantiate()
	bullet.set_name("bullet(Clone)")
	get_node("Pivot").add_child(bullet)
	pass


func _on_area_3d_area_entered(area):
	if area == get_tree().get_first_node_in_group("Enemy"):
		get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body == get_tree().get_first_node_in_group("Enemy"):
		get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
	pass # Replace with function body.
