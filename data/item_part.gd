class_name ItemPart 
extends Resource
## Resource for storing data of item parts needed for Item

@export var name: String ## Human readable name, used for color selection UI
@export var sprite: CompressedTexture2D ## Sprite for item part
@export var parent_node_id: String ## Node of [Skeleton] that the item part is a child off
@export var color_index: int ## Index of [Skeleton] colors array, that apply to this part
@export var position_x: float ## Relative to parent position on x-axis default value 0 
@export var position_y: float ## Relative to parent position on y-axis default 0 
@export var flip_h: bool ## is texture mirrored or not default value false
