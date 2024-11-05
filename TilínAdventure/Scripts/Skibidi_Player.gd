extends CharacterBody2D

var lives : int = 15
var cooldown : bool = false
const SPEED = 700
const JUMP_VELOCITY = -800.0


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func death():
	get_tree().change_scene_to_file("res://Escenas/muerte.tscn")

	
	


func _physics_process(delta):
	
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_released("Saltar"):
			velocity.y += 15000 * delta
		if Input.is_action_pressed("ui_down"):
			velocity.y += 25000 * delta 
			
	$CanvasLayer/Vidas.text = str(lives) + " vidas"

	

	# Handle jump.
		
	if Input.is_action_just_pressed("Saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var movement = Input.get_axis("ui_left","ui_right")
	
	if movement:
		velocity.x = SPEED * movement
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	




	move_and_slide()


func cooldownfunc():
	cooldown = true
	$CooldownTimer.start()
	$Tilin.play("cooldown")


func _on_player_collision_area_entered(area):
	if area.name != "AreaDePuntos":
		if lives <=0:
			get_tree().change_scene_to_file("res://Escenas/Skibidiinvasion.tscn")
		else:
			if cooldown == false:
				lives -= 1
				$Tilin.play("Damage")



func _on_tilin_animation_finished():
	if $Tilin.animation == "Damage":
		cooldownfunc()


func _on_cooldown_timer_timeout():
	cooldown = false
	$Tilin.play("pasos")




