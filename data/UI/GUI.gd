extends CanvasLayer

var minimum_value = -20

func _on_Reset_pressed():
	get_tree().reload_current_scene()


func _on_Back_pressed():
	Globals.change_level("back")


func _on_Options_pressed():
	$OptionsPane.show()


func _on_MasterVolume_value_changed(value):
	if value <= minimum_value:
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false)
	AudioServer.set_bus_volume_db(0, lerp(AudioServer.get_bus_volume_db(0), value, 1.0))


func _on_MusicVolume_value_changed(value):
	if value <= minimum_value:
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false)
	AudioServer.set_bus_volume_db(2, lerp(AudioServer.get_bus_volume_db(2), value, 1.0))


func _on_Return_pressed():
	$OptionsPane.hide()


func _on_Advance_pressed():
	Globals.change_level("advance")


func _on_SFXVolume_value_changed(value):
	if value <= minimum_value:
		AudioServer.set_bus_mute(1, true)
	else:
		AudioServer.set_bus_mute(1, false)
	AudioServer.set_bus_volume_db(1, lerp(AudioServer.get_bus_volume_db(1), value, 1.0))
