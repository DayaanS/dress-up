extends Node2D

func set_color(color_name, color):
	match color_name:
		"Skin":
			var parts = get_tree().get_nodes_in_group("skin")
			for part in parts:
				part.self_modulate = color
		"Pants":
			pass
		"Eyes":
			$Body/Neck/Head/EyeL/EyeWhite/EyeIris.self_modulate = color
			$Body/Neck/Head/EyeR/EyeWhite/EyeIris.self_modulate = color
		"Top":
			$Body/ArmL/ForearmL/HandL/Sprite2D.self_modulate = color
			$Body/ArmL/ForearmL/Sprite2D2.self_modulate = color
			$Body/ArmL/Sprite2D3.self_modulate = color
			$Body/ArmR/Sprite2D4.self_modulate = color
			$Body/ArmR/ForearmR/Sprite2D3.self_modulate = color
			$Body/ArmR/ForearmR/HandR/Sprite2D2.self_modulate = color
			$Body/Torso/Sprite2D.self_modulate = color
		"Hair":
			var parts = get_tree().get_nodes_in_group("hair")
			for part in parts:
				part.self_modulate = color
				

func get_item_part_data(item_part_id):
	var resource_file = "res://data/item_parts/" + item_part_id + ".tres"
	var item_part:ItemPart = load(resource_file) as ItemPart
	return item_part
	
func add_item_part(item:Item, item_part_data:ItemPart):
	var item_part = ItemPartNode.new()
	#var item_part_data = get_item_part_data(item_part_id)
	item_part.sprite = item_part_data.sprite
	item_part.color = item.colors[item_part_data.color_index]
	item_part.pos_x = item_part_data.position_x
	item_part.pos_y = item_part_data.position_y
	var parent = get_node("%"+item_part_data.parent_node_id)
	parent.add_child(item_part)

func add_item(item_id):
	var resource_file = "res://data/items/" + item_id + ".tres"
	var item:Item = load(resource_file) as Item
	for item_part_data in item.parts:
		add_item_part(item, item_part_data)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
	
