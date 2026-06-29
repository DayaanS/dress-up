class_name Item
extends Resource
## Resource for storing item data

@export var item_id: String ## Unique ID for each item
@export var icon: CompressedTexture2D ## item icon used for layers and item selection UI
@export var parts: Array[ItemPart] ## array of [ItemPart]
@export var colors: Array[Color] ## array of item color palette
