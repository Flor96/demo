extends CharacterBody2D


func _physics_process(delta: float) -> void :
	pass

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("Caballero"):
		$"../CaidaPinchos".play("Caida")
		pass
	
	
