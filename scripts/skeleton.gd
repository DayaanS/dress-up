extends Node2D

## Node that item parts attach to and is posed by animations
class_name Skeleton

@onready var arm_l_animations: AnimationPlayer = $AnimationTree/ArmLAnimations
@onready var leg_l_animations: AnimationPlayer = $AnimationTree/LegLAnimations
@onready var arm_r_animations: AnimationPlayer = $AnimationTree/ArmRAnimations
@onready var leg_r_animations: AnimationPlayer = $AnimationTree/LegRAnimations


func add_item_part(item:Item, item_part_data:ItemPart) -> void:
	var item_part = ItemPartNode.new()
	item_part.sprite = item_part_data.sprite
	item_part.color = item.colors[item_part_data.color_index]
	item_part.pos_x = item_part_data.position_x
	item_part.pos_y = item_part_data.position_y
	item_part.is_flip_h = item_part_data.flip_h
	var parent = get_node("%"+item_part_data.parent_node_id)
	parent.add_child(item_part)


func add_item(item:Item) -> void:
	for item_part_data in item.parts:
		add_item_part(item, item_part_data)


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

func play_animation(animation_player:AnimationPlayer, index:int) -> void:
	var animations_names_list = animation_player.get_animation_list()
	animation_player.play(animations_names_list[0]) # reset animation 
	animation_player.advance(0) # make sure first frame is immediatly used
	animation_player.play(animations_names_list[index]) # play selected animation
	animation_player.advance(0)


func set_color(item_part:ItemPartNode, color: Color) -> void:
	item_part.color = color
