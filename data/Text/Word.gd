extends Area2D

var hovering = false
var being_dragged = false
var placed = false
export (int) var value = 0

func _ready():
	var input_text = $Text.bbcode_text
	var effect_text = "[shake rate=5 level=10]%s[/shake]" % input_text
	$Text.bbcode_text = effect_text
	var my_extents = $Text.rect_size / 2
	$CollisionShape2D.shape.extents.x = my_extents.x - 10
	$CollisionShape2D.shape.extents.y = my_extents.y - 10
	$CollisionShape2D.position = my_extents

func _process(delta):
	if being_dragged:
		global_position = get_global_mouse_position()

func _input(event):
	if event.is_action_pressed("click") and hovering:
		being_dragged = true
	elif event.is_action_released("click"):
		being_dragged = false

func _on_Word_mouse_entered():
	hovering = true

func _on_Word_mouse_exited():
	hovering = false
