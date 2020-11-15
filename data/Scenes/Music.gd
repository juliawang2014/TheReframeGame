extends AudioStreamPlayer

func _ready():
	Globals.connect("mood_changed", self, "_on_mood_changed")
	_on_mood_changed(Globals.mood_level)

func _on_mood_changed(mood):
	if mood <= 1 and mood >= -1:
		for i in range(3, 7):
			AudioServer.set_bus_mute(i, true)
	elif mood >= 2 and mood <= 4:
		AudioServer.set_bus_mute(3, false)
		AudioServer.set_bus_mute(4, true)
	elif mood > 4:
		AudioServer.set_bus_mute(4, false)
	elif mood <= -2 and mood >= -4:
		AudioServer.set_bus_mute(5, false)
		AudioServer.set_bus_mute(6, true)
	elif mood < -4:
		AudioServer.set_bus_mute(6, false)
