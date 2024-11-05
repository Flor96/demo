extends CharacterBody2D

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("Caballero"):
#		Hacer que caiga el pincho
		print("si toca al caballero")
	pass
