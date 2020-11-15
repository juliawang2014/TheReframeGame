extends ColorRect

func _input(event):
	if event.is_action_pressed("click"):
		Globals.change_level("advance")
