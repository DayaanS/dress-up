extends Node2D

## Item Node that item parts attach to and can be posed by animations
class_name Skeleton

## Left arm animations player
@onready var arm_l_animations: AnimationPlayer = $AnimationTree/ArmLAnimations
## Left leg animations player
@onready var leg_l_animations: AnimationPlayer = $AnimationTree/LegLAnimations
## Right arm animations player
@onready var arm_r_animations: AnimationPlayer = $AnimationTree/ArmRAnimations
## Right leg animations player
@onready var leg_r_animations: AnimationPlayer = $AnimationTree/LegRAnimations


## Create Item Part Node and attach it to parent node in the skeleton
func add_item_part(item:Item, item_part_data:ItemPart) -> void:
	var item_part = ItemPartNode.new()
	item_part.sprite = item_part_data.sprite
	item_part.color = item.colors[item_part_data.color_index]
	item_part.pos_x = item_part_data.position_x
	item_part.pos_y = item_part_data.position_y
	item_part.is_flip_h = item_part_data.flip_h
	var parent = get_node("%"+item_part_data.parent_node_id)
	parent.add_child(item_part)


## Iterate over item part list in item and add item part
func add_item(item:Item) -> void:
	for item_part_data in item.parts:
		add_item_part(item, item_part_data)


## Play animation from animation player
func play_animation(animation_player: AnimationPlayer, index: int) -> void:
	var animations_names_list: PackedStringArray = animation_player.get_animation_list()
	animation_player.play(animations_names_list[0]) # reset animation 
	animation_player.advance(0) # make sure first frame is immediatly used
	animation_player.play(animations_names_list[index]) # play selected animation
	animation_player.advance(0)


## Match limbs and [method play_animation] corresponding to them
func set_pose(category: String, index: int) -> void:
	match category:
		"arm_l":
			play_animation(arm_l_animations, index)
		"arm_r":
			play_animation(arm_r_animations, index)
		"leg_l":
			play_animation(leg_l_animations, index)
		"leg_r":
			play_animation(leg_r_animations, index)


## Change color value of item part
func set_color(item_part_node:ItemPartNode, color: Color) -> void:
	item_part_node.color = color
