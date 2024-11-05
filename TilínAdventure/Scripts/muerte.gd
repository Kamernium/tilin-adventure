extends Node2D



func _process(_delta):
	$Highscore.text = "tu mayor puntuación: " + str(Save.ValoresGuardados["highscore"])
	$score.text = "Esta vez has logrado " + str(Save.ValoresGuardados["score"]) + " puntos"


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/main.tscn")
