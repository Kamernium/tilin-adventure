extends Area2D


var velocity : int = 1000



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= velocity * delta






