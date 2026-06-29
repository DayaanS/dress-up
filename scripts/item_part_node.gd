class_name ItemPartNode
extends Sprite2D
## Node that attaches to [Skeleton] and uses [ItemPart] data

var parent: Sprite2D ## What node is a child of
var sprite: CompressedTexture2D ## Sprite texture 
var color: Color ## Color that sprite is moduleted to
var pos_x: float ## position on x-axis
var pos_y: float ## position on y-axis
var is_flip_h: bool ## is sprite flipped


## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = sprite
	self_modulate = color
	position = Vector2(pos_x, pos_y)
	flip_h = is_flip_h
