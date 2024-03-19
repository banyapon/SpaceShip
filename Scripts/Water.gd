extends MeshInstance3D

var speed = 6.0

func _process(delta):
	get_surface_override_material(0).uv1_offset.y -= delta + speed
	pass
