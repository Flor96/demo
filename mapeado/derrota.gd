extends Control

func _ready() -> void:
	Ui.vidas_caballero = 3
	await get_tree().create_timer(6).timeout
	Transicion.Transicion("res://Mapas/Mapa 1.tscn")
	pass
