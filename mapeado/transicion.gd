extends CanvasLayer

func Transicion(_root):
	$ColorRect.show()
	$AnimationPlayer.play("Trans")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(_root)
	$AnimationPlayer.play_backwards("Trans")
	await $AnimationPlayer.animation_finished
	$ColorRect.hide()
	pass
