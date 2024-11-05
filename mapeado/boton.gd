extends RigidBody2D

var pressed = false
signal boton_pressed(valor)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Pressed.visible = pressed
	$Released.visible = !pressed

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Caballero"):
		pressed = true
		boton_pressed.emit(pressed)


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("Caballero"):
		pressed = false
		boton_pressed.emit(pressed)

#Pruebas para hacer con el mouse mientras no existe jugador
func _on_area_2d_mouse_entered() -> void:
	pressed = true
	boton_pressed.emit(pressed)

func _on_area_2d_mouse_exited() -> void:
	pressed = false
	boton_pressed.emit(pressed)
