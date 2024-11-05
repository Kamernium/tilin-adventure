extends Area2D

var puntos : int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Puntos.text = "puntos: " + str(puntos)
	if puntos >= 300:
		get_tree().change_scene_to_file("res://Escenas/créditos.tscn")


func _on_area_entered(area):
	if area.name == "PlayerCollision":
		puntos += 1
