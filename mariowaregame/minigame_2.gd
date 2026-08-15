extends Node2D

@onready var themed_timer: Node2D =$Themedtimer
# Called when the node enters the scene tree for the first time.
var buttons_pressed := 0
var timer_end = false
func _ready() -> void:
	await themed_timer.Timer(7.0)
	timer_end=true # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if buttons_pressed==4:
		if Global.minigames_done >3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	if timer_end:
		Global.lives -=1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")


func _on_button_1_pressed() -> void:
	pass # Replace with function body.
