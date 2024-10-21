extends RigidBody2D

var abierta = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func abrir_puerta():
	abierta = true
	$AnimationPlayer.play("abrir")

func cerrar_puerta():
	abierta = false
	$AnimationPlayer.play("cerrar")


func _on_boton_boton_pressed(valor : bool) -> void:
	if valor:
		abrir_puerta()
	else:
		cerrar_puerta()
