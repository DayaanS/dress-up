class_name ItemSelection
extends Control
## Item selection UI

@onready var bodies_list: ItemList = %Bodies ## ItemList node for all bodies
@onready var eyes_list: ItemList = %Eyes ## ItemList node for all eyes
@onready var brows_list: ItemList = %Brows  ## ItemList node for all brows
@onready var mouths_list: ItemList = %Mouths  ## ItemList node for all mouths 
@onready var hair_list: ItemList = %Hair  ## ItemList node for all hair
@onready var clothes_list: ItemList = %Clothes ## ItemList node for all clothes
@onready var accessories_list: ItemList = %Accessories ## ItemList node for all accessories
@onready var arm_l_poses_list: ItemList = $TabContainer/Poses/ArmLPoses ## ItemList node for all left arm poses
@onready var leg_l_poses_list: ItemList = $TabContainer/Poses/LegLPoses ## ItemList node for all left leg poses
@onready var arm_r_poses_list: ItemList = $TabContainer/Poses/ArmRPoses ## ItemList node for all right arm poses
@onready var leg_r_poses_list: ItemList = $TabContainer/Poses/LegRPoses ## ItemList node for all right leg poses
@export var layers_ui: Control ## [LayersSelection] UI node
@export var outfit: Node2D ## Parent node for all current [Skeleton] nodes
var skeleton_scene: PackedScene = preload("res://scenes/skeleton.tscn") ## [Skeleton] scene to instantiate
var current_item_nodes: Dictionary[String, Skeleton] = {} ## Current [Skeleton] nodes dictionary with item_id as keys
@onready var item_color_selection: Control = $"../ItemColorSelection" ## [ItemColorSelection] UI node


## adds a [Skeleton] base for item_parts to attach to and returns that node
func add_item_to_body(all_items_data:Array[Item], index:int, selected: bool) -> void:
	if selected == true:
		var skeleton:Skeleton = skeleton_scene.instantiate()
		outfit.add_child(skeleton)
		skeleton.add_item(all_items_data[index])
		current_item_nodes[all_items_data[index].item_id] = skeleton
		layers_ui.add_layer_to_UI(all_items_data[index].item_id, all_items_data[index].icon)
	else:
		current_item_nodes[all_items_data[index].item_id].free()
		layers_ui.remove_layer_from_UI(all_items_data[index].item_id)


## reselects the selected item for new user selected colors to update
func reselect_item() -> void:
	var selected_item_array:Array[Item] = Global.get_array_of_item(Global.selected_item)
	var index: int = selected_item_array.find(Global.selected_item)
	add_item_to_body(selected_item_array, index, false)
	add_item_to_body(selected_item_array, index, true)


## deselect item from ItemList
func deselect_item(selected_item_array: Array[Item], index: int) -> void:
	match selected_item_array:
		Global.all_bodies_data:
			bodies_list.deselect(index)
		Global.all_eyes_data:
			eyes_list.deselect(index)
		Global.all_brows_data:
			brows_list.deselect(index)
		Global.all_mouths_data:
			mouths_list.deselect(index)
		Global.all_hair_data:
			hair_list.deselect(index)
		Global.all_clothes_data:
			clothes_list.deselect(index)
		Global.all_accessories_data:
			accessories_list.deselect(index)


## set pose for current [Skeleton] nodes
func set_pose_for_limb(limb: String, index: int):
	for key in current_item_nodes:
		if current_item_nodes[key] != null and is_instance_valid(current_item_nodes[key]):
			current_item_nodes[key].set_pose(limb, index)


## Called when the node enters the scene tree for the first time.
## Populates ItemList nodes with item or and names
func _ready() -> void:
	for item in Global.all_bodies_data:
		bodies_list.add_icon_item(item.icon)
	for item in Global.all_eyes_data:
		eyes_list.add_icon_item(item.icon)
	for item in Global.all_brows_data:
		brows_list.add_icon_item(item.icon)
	for item in Global.all_mouths_data:
		mouths_list.add_icon_item(item.icon)
	for item in Global.all_hair_data:
		hair_list.add_icon_item(item.icon)
	for item in Global.all_clothes_data:
		clothes_list.add_icon_item(item.icon)
	for item in Global.all_accessories_data:
		accessories_list.add_icon_item(item.icon)
	
	for animation in Global.arm_l_animations.get_animation_list():
		arm_l_poses_list.add_item(animation)
	for animation in Global.arm_r_animations.get_animation_list():
		arm_r_poses_list.add_item(animation)
	for animation in Global.leg_l_animations.get_animation_list():
		leg_l_poses_list.add_item(animation)
	for animation in Global.leg_r_animations.get_animation_list():
		leg_r_poses_list.add_item(animation)
	
	Global.connect("update_color", Callable (self, "reselect_item"))


func _on_bodies_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_bodies_data, index, selected)


func _on_eyes_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_eyes_data, index, selected)


func _on_brows_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_brows_data, index, selected)


func _on_mouths_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_mouths_data, index, selected)


func _on_hair_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_hair_data, index, selected)


func _on_clothes_list_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_clothes_data, index, selected)


func _on_accessories_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_accessories_data, index, selected)


func _on_arm_l_poses_item_selected(index: int) -> void:
	set_pose_for_limb("arm_l", index)

func _on_arm_r_poses_item_selected(index: int) -> void:
	set_pose_for_limb("arm_r", index)

func _on_leg_l_poses_item_selected(index: int) -> void:
	set_pose_for_limb("leg_l", index)

func _on_leg_r_poses_item_selected(index: int) -> void:
	set_pose_for_limb("leg_r", index)
