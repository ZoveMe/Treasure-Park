extends  Area3D

func _process(delta):
	rotate_y(0.01)


func _on_body_entered(body: Node3D):
	$"Coin sound".play()
	$MeshInstance3D.queue_free()


func _on_coin_sound_finished():
	queue_free()
