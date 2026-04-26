extends Sprite2D
class_name ItemPart

var color: Color = "92315b"
var parent = "Skeleton/Torso"
var sprite_path = preload("uid://tl8f7di7ople")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self_modulate = color
	texture = sprite_path
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
