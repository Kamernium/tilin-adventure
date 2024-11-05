extends CharacterBody2D

var lives : int = 10
var score : int 
var highscore = Save.ValoresGuardados["highscore"]
var cooldown : bool = false
const SPEED = 700
const JUMP_VELOCITY = -700.0



var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func death():
	get_tree().change_scene_to_file("res://Escenas/muerte.tscn")

func GuardarPuntuacion():
	Save.ValoresGuardados["score"] = score
	if score > highscore:
		highscore = score
		Save.ValoresGuardados["highscore"] = highscore
	Save.save_data()
	
	


func _physics_process(delta):
	# Add the gravity.
	
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_released("Saltar"):
			velocity.y += 15000 * delta
		if Input.is_action_pressed("ui_down"):
			velocity.y += 25000 * delta 
			
	$CanvasLayer/Vidas.text = str(lives) + " vidas"
	$CanvasLayer/score.text = str(score)
	

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
			GuardarPuntuacion()
			get_tree().change_scene_to_file("res://Escenas/muerte.tscn")
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


func _on_score_timer_timeout():
	score += 1
	$ScoreTimer.start()
