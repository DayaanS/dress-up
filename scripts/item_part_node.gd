extends Sprite2D
class_name ItemPartNode

var parent: Sprite2D
var sprite: CompressedTexture2D
var color: Color
var pos_x: float
var pos_y: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = sprite
	self_modulate = color
	position = Vector2(pos_x, pos_y)

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
