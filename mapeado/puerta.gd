extends RigidBody2D

var abierta = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	pass

func abrir_puerta():
	abierta = true
	$AnimationPlayer.play("abrir")

func cerrar_puerta():
	abierta = false
	$AnimationPlayer.play("cerrar")


func _on_boton_boton_pressed(valor : bool):
	if valor:
		abrir_puerta()
	else:
		cerrar_puerta()
