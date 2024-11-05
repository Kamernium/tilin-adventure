extends Control





func _on_jugar_pressed():
	if $"contraseña".text == "skibidi":
		get_tree().change_scene_to_file("res://Escenas/skibidi_título.tscn")
	else:
		get_tree().change_scene_to_file("res://Escenas/main.tscn")
	

