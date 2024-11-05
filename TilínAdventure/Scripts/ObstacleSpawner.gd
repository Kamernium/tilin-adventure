extends Node2D

var SpawnTime = 0
var ObstacleList = ["res://Escenas/obstacle_1.tscn","res://Escenas/obstacle_2.tscn","res://Escenas/obstacle_3.tscn" ]




func _ready():
	randomize()
	
	


func _on_timer_timeout():
	randomize()
	var ObstacleToSpawn = randi_range(0,2)
	var ObstaclePath = ObstacleList[ObstacleToSpawn]
	var Obstacle = load(ObstaclePath)
	SpawnTime = randi_range(1,4)
	ObstacleToSpawn = randi_range(0,2)
	$Timer.wait_time = SpawnTime
	
	var Obstacleinstance = Obstacle.instantiate()
	add_child(Obstacleinstance)
