extends Control

var sentence_value: int = 0

signal sentence_valid

#func _ready():
#	for place in $Parts/Places.get_children():
#		place.connect("update_value", self, "_update_sentence")

#func _update_sentence(v):
#	sentence_value += v


func _on_Think_pressed():
	check_sentence()
#	print(sentence_value)

func check_sentence():
	var level = Globals.current_level
	var valids = Globals.level_valids[level].values()
	var my_key = ""
	var normal = Globals.level_valids[level]["Norm"]
	var bad = Globals.level_valids[level]["Bad"]
	var good = Globals.level_valids[level]["Good"]
	for child in $Parts.get_children():
		if child is Area2D and child.placed:
			sentence_value += child.value
	if valids.has(sentence_value):
		match sentence_value:
			normal:
				my_key = "Norm"
			bad:
				my_key = "Bad"
			good:
				my_key = "Good"
		emit_signal("sentence_valid", my_key)
		$Think/ButtonSFX.play()
	else:
		sentence_value = 0
		$Pulse/AnimationPlayer.play("pulse")
