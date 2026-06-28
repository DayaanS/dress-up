extends Node2D

class_name Skeleton

@onready var arm_animations: AnimationPlayer = $AnimationTree/ArmAnimations
@onready var leg_animations: AnimationPlayer = $AnimationTree/LegAnimations


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


func set_pose(category, index):
	if category == "arm":
		var arm_animations_array = arm_animations.get_animation_list()
		arm_animations.play(arm_animations_array[index])
		print(arm_animations_array)
	elif category == "leg":
		var animations_array = leg_animations.get_animation_list()
		leg_animations.play(animations_array[index])


func set_color(item_part:ItemPartNode, color):
	item_part.color = color
