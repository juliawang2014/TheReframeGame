extends Sprite

onready var sad_sounds = preload("res://assets/Sounds/Panic1.wav")
onready var panic_sounds = preload("res://assets/Sounds/Panic1.wav")
var eye_radius = 1

func _ready():
	Globals.connect("mood_changed", self, "change_mood")
	change_mood(Globals.mood_level)

func change_mood(mood):
	if mood <= 1 and mood >= -1:
		$Sounds.stop()
		$AnimationPlayer.play("normal")
	elif mood >= 2 and mood <= 4:
		$Sounds.stop()
		$AnimationPlayer.play("happy")
	elif mood > 4:
		$Sounds.stop()
		$AnimationPlayer.play("joyful")
	elif mood <= -2 and mood >= -4:
		$Sounds.stream = sad_sounds
		$Sounds.play()
		$AnimationPlayer.play("sad")
	elif mood < -4:
		$Sounds.stream = panic_sounds
		$Sounds.play()
		$AnimationPlayer.play("panicking") 
