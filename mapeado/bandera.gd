extends StaticBody2D



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Caballero"):
		get_tree().paused = true
		await get_tree().create_timer(1).timeout
		Transicion.Transicion("res://continuara.tscn")
	pass # Replace with function body.
