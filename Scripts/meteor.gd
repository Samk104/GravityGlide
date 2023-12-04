extends CharacterBody2D

var fall = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y = 0
	if fall == true:
		velocity.y += gravity * delta * 16
	
	move_and_slide()


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		fall = true
	

func death():
	fall = false
	self.queue_free()
	
func _on_player_death_body_entered(body):
	if body.name == "Player":
		body.health -= 10
		self.queue_free()
		death()
	
