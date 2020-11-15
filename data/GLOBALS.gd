extends Node

#NORM-BAD-GOOD
var level_valids = {
	1: {
		"Norm": 2,
		"Bad": 3,
		"Good": 5
	},
	2: {
		"Norm": 24,
		"Bad": 7,
		"Good": 11
	},
	3: {
		"Norm": 10,
		"Bad": 3,
		"Good": 0
	},
	4: {
		"Norm": 18,
		"Bad": 17,
		"Good": 25
	},
	5: {
		"Norm": 130,
		"Bad": 3,
		"Good": 49
	},
	6: {
		"Norm": 0,
		"Bad": 24,
		"Good": 25
	}
}

var current_level = 0
var levels = ["res://data/Scenes/Opening.tscn",
			"res://data/Scenes/TryHard.tscn",
			"res://data/Scenes/TheOthers.tscn",
			"res://data/Scenes/NotEnough.tscn",
			"res://data/Scenes/Friends.tscn",
			"res://data/Scenes/WantMe.tscn",
			"res://data/Scenes/Today.tscn",
			"res://data/Scenes/Ending.tscn"
			]
var mood_level = 0

signal mood_changed


func change_level(type):
	match type:
		"back":
			current_level -= 1
			if current_level <= 0:
				current_level = 0
				reset()
		"advance":
			current_level += 1
			if current_level >= levels.size():
				current_level = 0
				reset()
	get_tree().change_scene(levels[current_level])

func reset():
	mood_level = 0
	emit_signal("mood_changed", mood_level)

func change_mood_level(value):
	mood_level += value
	emit_signal("mood_changed", mood_level)
