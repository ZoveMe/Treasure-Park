extends MultiMeshInstance3D

@export var grass_scene: PackedScene

func _ready():
	if !grass_scene:
		print("No grass scene assigned!")
		return
	
	var terrain_size = 20  # Adjust based on your terrain size
	var multi_mesh = MultiMesh.new()
	multi_mesh.mesh = grass_scene.instantiate().get_node("MeshInstance3D").mesh
	multi_mesh.instance_count = 100  # Adjust for density
	multi_mesh.transform_format = MultiMesh.TRANSFORM_3D
	self.multimesh = multi_mesh

	for i in range(multi_mesh.instance_count):
		var transform = Transform3D()
		transform.origin = Vector3(randf_range(-terrain_size, terrain_size), 0, randf_range(-terrain_size, terrain_size))
		multi_mesh.set_instance_transform(i, transform)
