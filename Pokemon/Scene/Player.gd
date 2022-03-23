extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity=Vector2()
	if Input.is_key_pressed(KEY_UP):
		velocity.y=-1
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y=1
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x=1
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x=-1
	self.position=self.position+velocity.normalized()*400*delta
