extends Area2D

var new_value = 0
var has_a_word = false

#signal update_value(v)

func _ready():
	var overlapping = get_overlapping_areas()
	if overlapping.size() != 0:
		_on_Placement_area_entered(get_overlapping_areas().front())
#	else:
#		has_a_word = false
#	_on_Placement_area_entered(overlapping.front())

func _on_Placement_area_entered(area):
#	if not has_a_word:
#		has_a_word = true
	area.placed = true
#		new_value = area.value
##		print(new_value)
#		send_signal(new_value)
#	var overlapping = get_overlapping_areas()
#	if get_overlapping().size() != 0:
#		return
#	else:
#		new_value = area.value
#		send_signal(new_value)

func _on_Placement_area_exited(area):
#	if has_a_word:
#		has_a_word = false
	area.placed = false
#		new_value = 0
##		print(new_value)
#		send_signal(new_value)
#	if get_overlapping().size() != 0:
#		return
#	else:
#		new_value = -area.value
#		send_signal(new_value)

#func send_signal(v):
#	emit_signal("update_value", v)
#
#func get_overlapping():
#	return get_overlapping_areas()
