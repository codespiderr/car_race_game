extends Node2D

var tot_laps = 2
var laps = 0

var check1 = false
var check2 = false
var check3 = false
var check4 = false
var final = false
func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	$CanvasLayer/Label.text = str(laps) + "/" + str(tot_laps)
	


func _on_checkpoint_1_body_exited(body: Node2D) -> void:
	check1 = true
	print("check1")

func _on_checkpoint_2_body_exited(body: Node2D) -> void:
	check2 = true
	print("check2")

func _on_checkpoint_4_body_exited(body: Node2D) -> void:
	check4 = true
	print("check4")

func _on_checkpoint_3_body_exited(body: Node2D) -> void:
	check3 = true
	print("check3")

func _on_lap_start_body_exited(body: Node2D) -> void:
	if check1 and check2 and check4 and check3:
		laps+=1
		check1 = false
		check2 = false
		check3 = false 
		check4 = false
