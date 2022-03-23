extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var contatore_pokeball=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity=Vector2()
	if Input.is_key_pressed(KEY_UP):
		velocity.y=-1
		$RayCast2D.cast_to=Vector2(0,-50)
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y=1
		$RayCast2D.cast_to=Vector2(0,50)
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x=1
		$RayCast2D.cast_to=Vector2(50,0)
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x=-1
		$RayCast2D.cast_to=Vector2(-50,0)
	
	var movimento=velocity.normalized()*400*delta
	self.move_and_collide(movimento)
	self.animazione(velocity)
	
	if $RayCast2D.is_colliding():
		var collider=$RayCast2D.get_collider()
		if collider and "Pokeball" in collider.name and Input.is_key_pressed(KEY_SPACE):
			collider.queue_free()
			contatore_pokeball+=1
			print(contatore_pokeball)

func animazione(velocity):
	if velocity.y==1:
		$Player.play("walk_down")
	elif velocity.y==-1:
		$Player.play("walk_up")
	elif velocity.x==-1:
		$Player.play("walk_left")
		$Player.flip_h=false
	elif velocity.x==1:
		$Player.play("walk_left")
		$Player.flip_h=true
		
		#da qui controllo per quando è fermo
	
	if velocity==Vector2():
		if $Player.animation=="walk_down":
			$Player.play("stand_down")
		if $Player.animation=="walk_up":
			$Player.play("stand_up")
		if $Player.animation=="walk_left":
			$Player.play("stand_left")
