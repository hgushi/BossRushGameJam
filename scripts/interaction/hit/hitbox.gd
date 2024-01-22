class_name HitBox extends BaseHitBox

@export var hp : float = 1
@export var projectile_speed : int = 100

func _ready():
	$AnimatedSprite2D.play("projectile_idle")

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += projectile_speed * delta * direction

func destroy():
	# implement animation and effects here
	queue_free()

func on_hit(damage : float, damager : Node2D):
	super(damage, damager)  

func _get_hp():
	return hp
	
func _set_hp(health):
	hp = health


func _on_area_entered(area):
	if area.is_in_group("Sword"):
		print(global_rotation)
		global_rotation_degrees += 180
