extends Control

@onready var clothes_list: ItemList = %ClothesList
@onready var hair_front_list: ItemList = %HairFront
@onready var hair_back_list: ItemList = %HairBack

@onready var layers_ui: Control = $"../Layers"

@export var outfit: Node

var skeleton_scene = preload("res://scenes/skeleton.tscn")

var all_clothes_data:Array[Item] = []
var all_hair_front_data:Array[Item] = []
var all_hair_back_data:Array[Item] = []

var current_item_nodes:Dictionary = {}

@onready var item_color_selection: Control = $"../ItemColorSelection"

# gets Item files from path and returns the array of Items
func get_items(path):
	var items_array:Array[Item] = []
	for file in DirAccess.get_files_at(path):
		var resource_file = path + file
		var item:Item = load(resource_file) as Item
		items_array.append(item)
	return items_array

# adds a skeleton base for item_parts to attach to and returns that node
func add_skeleton():
	var instance:Skeleton = skeleton_scene.instantiate()
	outfit.add_child(instance)
	return instance


func add_item_to_body(all_items_data, index:int, selected: bool, category):
	if selected == true:
		var skeleton:Skeleton = add_skeleton()
		skeleton.add_item(all_items_data[index])
		item_color_selection.add_item_colors(all_clothes_data[index])
		current_item_nodes[index] = skeleton
		layers_ui.add_layer_to_UI(category+ str(index), selected, all_items_data[index].icon)

	else:
		current_item_nodes[index].queue_free()
		item_color_selection.remove_item_colors()
		layers_ui.remove_layer_from_UI(category + str(index))


# Called when the node enters the scene tree for the first time.
# Gets data with get_items(path) function and populates ItemList nodes with items
func _ready() -> void:
	all_clothes_data = get_items("res://data/items/")
	all_hair_back_data = get_items("res://data/hair_back/")
	all_hair_front_data = get_items("res://data/hair_front/")
	for item in all_clothes_data:
		clothes_list.add_item(item.name, item.icon, true)
	for item in all_hair_back_data:
		hair_back_list.add_item(item.name, item.icon, true)
	for item in all_hair_front_data:
		hair_front_list.add_item(item.name, item.icon, true)
	print(current_item_nodes)
	

func _on_item_list_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(all_clothes_data, index, selected, "clothes")

func _on_hair_front_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(all_hair_front_data,index,selected, "hair_front")
	
func _on_hair_back_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(all_hair_back_data, index, selected, "hair_back")
