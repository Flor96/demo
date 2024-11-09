extends Control

var vidas_caballero: int = 3


func _process(delta: float) -> void:
	if (vidas_caballero > 0):
		if vidas_caballero == 2:
			$Vidas/Vida3.visible = false
			pass
		if vidas_caballero == 1:
			$Vidas/Vida2.visible = false
			pass
		pass
	if (vidas_caballero == 0):
		$Vidas/Vida1.visible = false
		await get_tree().create_timer(1).timeout
		Transicion.Transicion("res://derrota.tscn")
	pass
