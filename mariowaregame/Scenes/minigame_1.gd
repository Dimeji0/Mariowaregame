extends Node2D
@onready var themed_timer: Node2D = $Themedtimer

var burger_collected=0
var timer_end=false




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await themed_timer.Timer(10.0)
	timer_end= true # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if burger_collected== 3:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	if timer_end:
		Global.minigames_done -=1
		Global.lives -=1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	


func _on_burger_burger_collected() -> void:
	burger_collected = burger_collected +1
	return
 # Replace with function body.


func _on_burger_2_burger_collected() -> void:
	burger_collected = burger_collected +1
	return
	 # Replace with function body.


func _on_burger_3_burger_collected() -> void:
	burger_collected = burger_collected +1
	return
	# Replace with function body.
