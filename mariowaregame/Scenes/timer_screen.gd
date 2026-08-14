extends Node2D

@onready var meal_box: HBoxContainer = $"meal box"
@onready var burger_1: TextureRect = $"meal box/burger1"
@onready var burger_2: TextureRect = $"meal box/burger2"
@onready var burger_3: TextureRect = $"meal box/burger3"
@onready var burger_4: TextureRect = $"meal box/burger4"
@onready var burge_51: TextureRect = $"meal box/burger5"
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time
func _ready()  -> void:
	await Timer(5.0)  # using the function created
	if Global.minigames_done < 3:
		Global.minigames_done= Global.minigames_done  +1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/title_scene.tscn")
	
# Above, your script is being told to go to the next minigame. If the 
# current minigame is Level 1, then you would be on minigame 1. If you 
# complete that level, you have the minigames_done add one, and then you 
# look for the scene titled `minigame_` and then whatever minigame number 
# should be next. Make sure you name your minigame saves appropriately.
# Called when the node enters the scene tree for the first ti 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives:
		4: 
			$"meal box/burger1".hide()
		3:
			$"meal box/burger1".hide()
			$"meal box/burger2".hide()
		2:
			$"meal box/burger1".hide()
			$"meal box/burger2".hide()
			$"meal box/burger3".hide()
		1:
			$"meal box/burger1".hide()
			$"meal box/burger2".hide()
			$"meal box/burger3".hide()
			$"meal box/burger4".hide()
		0: $"meal box".hide()
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done)
func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await get_tree().create_timer(0.1).timeout
		time -=0.1
		return
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
		
		
