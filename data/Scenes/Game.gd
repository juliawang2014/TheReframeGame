extends Node2D

enum STATES {joyful, happy, normal, sad, panicking}
var current_state

var normal_color = Color("404040")
var happy_color = Color("8a8a8a")
var joyful_color = Color("ffffff")
var sad_color = Color("2d2d2d")
var panicking_color = Color("000000")
var vignette_transparent = Color("00ffffff")
var vignette_solid = Color("ffffff")

func _ready():
	Globals.connect("mood_changed", self, "change_mood")
	change_mood(Globals.mood_level)

func sentence_is_valid(mood):
	match mood:
		"Norm":
			Globals.change_mood_level(-1)
		"Bad":
			Globals.change_mood_level(-2)
		"Good":
			Globals.change_mood_level(1)
	$Timer.start()
	$Clouds/AnimationPlayer.play_backwards("move")

func _on_Timer_timeout():
	Globals.change_level("advance")

func change_mood(mood):
	if mood <= 1 and mood >= -1:
		tween_color(normal_color)
		$Camera2D.stop_panic()
	elif mood >= 2 and mood <= 4:
		tween_color(happy_color)
	elif mood > 4:
		tween_color(joyful_color)
	elif mood <= -2 and mood >= -4:
		tween_color(sad_color)
		$Camera2D.play_panic(1.0)
		tween_vignette(vignette_transparent)
	elif mood < -4:
		tween_color(panicking_color)
		$Camera2D.play_panic(1.5)
		tween_vignette(vignette_solid)

func tween_vignette(alpha):
	$Effect/Vignette/Tween.interpolate_property($Effect/Vignette, "modulate",
		$Effect/Vignette.modulate, alpha, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Effect/Vignette/Tween.start()

func tween_color(new_color):
	$CanvasLayer/TextureRect/Tween.interpolate_property($CanvasLayer/TextureRect, "self_modulate",
		$CanvasLayer/TextureRect.self_modulate, new_color, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/TextureRect/Tween.start()
