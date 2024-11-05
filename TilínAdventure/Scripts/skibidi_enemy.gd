extends Area2D

func ElegirAnim():
	var elegir = randi_range(1,4)
	if elegir == 1:
		$AnimationPlayer.play("LeftRight")
	elif elegir == 2:
		$AnimationPlayer.play("UpDown")
	elif elegir == 3:
		$AnimationPlayer.play("Diagonal")
	elif elegir == 4:
		$AnimationPlayer.play("Diagonal2")




func _ready():
	randomize()
	ElegirAnim()



func _on_animation_player_animation_finished(_anim_name):
	ElegirAnim()
