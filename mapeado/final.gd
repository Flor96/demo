extends Control


func _ready() -> void:
	await get_tree().create_timer(5).timeout
	get_tree().quit()
	pass # Replace with function body.
