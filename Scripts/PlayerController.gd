extends RigidBody2D

var health = 10
var GravityStrength = 100
var JUMP_VELOCITY = 600
#@onready var anim = get_node("AnimatedSprite2D")
var grounded = true

func _ready():
	contact_monitor = true
	max_contacts_reported = 10
	#Change Skin
	var items = Global.new().Items
	if (items[0]):#Emaculate logic
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
	if (items[1]):
		$Sprite2D.visible = false
		$Sprite2D2.visible = false
		$Sprite2D3.visible = true

func _physics_process(_delta):
	# Handle Gravity.
	var grav := Input.get_accelerometer()
	if grav == Vector3.ZERO:
		grav = Vector3.DOWN
	var gravAngle : float = clamp(Vector2(grav.x, grav.y).angle(), -120 * PI / 180, 0)
	#print(Vector2(grav.x, -grav.y))
	constant_force = Vector2.RIGHT.rotated(gravAngle) * mass * GravityStrength * 1.5
	
	# Handle Jump.
	if (Input.is_action_just_pressed("ui_up") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and grounded:
		grounded = false
		#apply_central_impulse(Vector2(0, -mass*JUMP_VELOCITY))
		linear_velocity = Vector2(linear_velocity.x, -JUMP_VELOCITY)
	
	# Handle Death.
	if health <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func onCollision(_body : Node):
	grounded = true
