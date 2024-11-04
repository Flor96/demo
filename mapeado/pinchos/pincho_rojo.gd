extends RigidBody2D

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("Caballero"):
		print("si toca al caballero el pincho rojo")
	pass
