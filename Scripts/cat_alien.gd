extends CharacterBody2D


var SPEED = 80
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _physics_process(delta):
	#Gravity for cat alien
	velocity.y += gravity * delta
	if chase == true:
		#player = get_node("../../Player/Player")
		player = $"../../Player"#get_node("play")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
	
	move_and_slide()
	
	
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
		


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_death_body_entered(body):
	if body.name == "Player":
		death()


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		body.health -= 10
		death()
		
func death():
	chase = false
	self.queue_free()
	
