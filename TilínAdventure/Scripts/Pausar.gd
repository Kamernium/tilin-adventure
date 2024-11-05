extends Node2D


func _ready():
	$texto_pausa.visible = false



func _process(_delta):
		
	if Input.is_action_just_pressed("Pausa") and get_tree().paused:
		get_tree().paused = false
		$texto_pausa.visible = false
	elif Input.is_action_just_pressed("Pausa") and get_tree().paused == false:
		get_tree().paused = true
		$texto_pausa.visible = true
