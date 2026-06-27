extends Control

@onready var clothes_list: ItemList = %ClothesList
@onready var hair_front_list: ItemList = %HairFront
@onready var hair_back_list: ItemList = %HairBack
@onready var poses_list: ItemList = $TabContainer/PosesList

@onready var layers_ui: Control = $"../Layers"

@export var outfit: Node

var skeleton_scene = preload("res://scenes/skeleton.tscn")
var body_scene = preload("res://scenes/body.tscn")

var current_item_nodes:Dictionary = {}

@onready var item_color_selection: Control = $"../ItemColorSelection"


# adds a skeleton base for item_parts to attach to and returns that node

func add_item_to_body(all_items_data, index:int, selected: bool):
	if selected == true:
		var skeleton:Skeleton = skeleton_scene.instantiate()
		outfit.add_child(skeleton)
		skeleton.add_item(all_items_data[index])
		current_item_nodes[index+1] = skeleton # + 1 cause item 0 is body
		
		layers_ui.add_layer_to_UI(all_items_data[index].item_id, selected, all_items_data[index].icon)
	
	else:
		current_item_nodes[index+1].queue_free()
		
		layers_ui.remove_layer_from_UI(all_items_data[index].item_id)

func update_item():
	var selected_item_array = Global.get_array_of_item(Global.selected_item)
	var index = selected_item_array.find(Global.selected_item)
	
	add_item_to_body(selected_item_array, index, false)
	add_item_to_body(selected_item_array, index, true)



# Called when the node enters the scene tree for the first time.
# Gets data with get_items(path) function and populates ItemList nodes with items
func _ready() -> void:
	var body:Skeleton = body_scene.instantiate()
	outfit.add_child(body)
	current_item_nodes[0] = body
	
	# populate item selection ui with all items
	for item in Global.all_clothes_data:
		clothes_list.add_item(item.name, item.icon, true)
	for item in Global.all_hair_back_data:
		hair_back_list.add_item(item.name, item.icon, true)
	for item in Global.all_hair_front_data:
		hair_front_list.add_item(item.name, item.icon, true)
	Global.connect("update_color", Callable (self, "update_item"))


func _on_item_list_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_clothes_data, index, selected)


func _on_hair_front_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_hair_front_data, index, selected)


func _on_hair_back_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(Global.all_hair_back_data, index, selected)


func _on_arm_l_poses_item_selected(index: int) -> void:
	for key in current_item_nodes:
		current_item_nodes[key].set_pose("arm", index)


func _on_leg_l_poses_item_selected(index: int) -> void:
	for key in current_item_nodes:
		current_item_nodes[key].set_pose("leg", index)
