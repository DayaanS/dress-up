extends Sprite2D

class_name ItemPartNode

var parent: Sprite2D
var sprite: CompressedTexture2D
var color: Color
var pos_x: float
var pos_y: float
var is_flip_h: bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = sprite
	self_modulate = color
	position = Vector2(pos_x, pos_y)
	flip_h = is_flip_h
