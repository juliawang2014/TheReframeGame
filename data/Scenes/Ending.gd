extends "res://data/Scenes/Placard.gd"

func _ready():
	$Score.bbcode_text = "[center]Mood level: %d[/center]" % Globals.mood_level
