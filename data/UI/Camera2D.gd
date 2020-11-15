extends Camera2D

func play_panic(speed):
	$AnimationPlayer.playback_speed = speed
	$AnimationPlayer.play("panic")

func stop_panic():
	$AnimationPlayer.stop()
	$Tween.interpolate_property(self, "zoom", zoom, Vector2(1.0,1.0), 0.8, 
		Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.start()
