extends Resource

class_name Item

@export var item_id: String # needs to be unique for each item, used to identify which item layer corresponds to
@export var name:String # human readable title for selection 
@export var category: String # not used 
@export var icon:CompressedTexture2D # icon for layers and item selection 
@export var parts:Array[ItemPart] # array of parts 
@export var colors:Array[Color] # array of colors
