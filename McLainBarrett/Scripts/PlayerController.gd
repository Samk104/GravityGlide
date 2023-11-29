extends RigidBody2D

func _ready():
	pass

func _physics_process(_delta):
	var grav = Input.get_accelerometer()
	constant_force = Vector2(grav.x, -grav.y) * mass * 100
