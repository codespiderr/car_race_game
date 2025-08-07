extends Node2D

var tot_laps = 3
var laps = 0
func show_count(text: String, delay := 1.0) -> void:
	$CanvasLayer/Label2.text = text
	await get_tree().create_timer(delay).timeout
func start_countdown():
	await show_count("3")
	await show_count("2")
	await show_count("1")
	await show_count("GO!", 0.8)
	$CanvasLayer/Label2.visible = false
	$CharacterBody2D.SPEED = 1000
	$CharacterBody2D2.SPEED = 1000
	
	$CharacterBody2D.rotate = 180
	$CharacterBody2D2.rotate = 180

func _on_button_pressed() -> void:

	$CanvasLayer/Label2.visible = true
	start_countdown()
	$CanvasLayer/Button.queue_free()
func _ready() -> void:
	$CharacterBody2D.SPEED = 0
	$CharacterBody2D2.SPEED = 0
	
	$CharacterBody2D.rotate = 0
	$CharacterBody2D2.rotate = 0
	$CanvasLayer/Label2.visible = false

func _process(delta: float) -> void:
	if $CharacterBody2D.laps>$CharacterBody2D2.laps:
		laps = $CharacterBody2D.laps
		Globals.winner = "blue car"
	else:
		Globals.winner = "yellow car"
		laps = $CharacterBody2D2.laps
	$CanvasLayer/Label.text = str(laps) + "/" + str(tot_laps)
	
	if laps == tot_laps:
		get_tree().change_scene_to_file("res://winner_disp.tscn")
		
func _on_checkpoint_1_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.check1 = true

func _on_checkpoint_2_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:	
		body.check2 = true

func _on_checkpoint_4_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.check4 = true

func _on_checkpoint_3_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.check3 = true

func _on_lap_start_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.check1 and body.check2 and body.check4 and body.check3:
			body.laps+=1
			print(body,body.laps)
			body.check1 = false
			body.check2 = false
			body.check3 = false 
			body.check4 = false
