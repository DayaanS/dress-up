extends Node2D
class_name Character

func add_item_part(item:Item, item_part_data:ItemPart):
	var item_part = ItemPartNode.new()
	item_part.sprite = item_part_data.sprite
	item_part.color = item.colors[item_part_data.color_index]
	item_part.pos_x = item_part_data.position_x
	item_part.pos_y = item_part_data.position_y
	item_part.is_flip_h = item_part_data.flip_h
	var parent = get_node("%"+item_part_data.parent_node_id)
	parent.add_child(item_part)


func add_item(item):
	for item_part_data in item.parts:
		add_item_part(item, item_part_data)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
	
