extends Node

var all_bodies_data: Array[Item] = []
var all_eyes_data: Array[Item] = []
var all_brows_data: Array[Item] = []
var all_mouths_data: Array[Item] = []
var all_hair_data: Array[Item] = []
var all_clothes_data:Array[Item] = []
var all_items_data: Array[Item] = []
var all_accessories_data: Array[Item] = []
var selected_item: Item

var arm_l_animations: AnimationLibrary = load("res://data/arm_l_animations.res")
var arm_r_animations: AnimationLibrary = load("res://data/arm_r_animations.res")
var leg_l_animations: AnimationLibrary = load("res://data/leg_l_animations.res")
var leg_r_animations: AnimationLibrary = load("res://data/leg_r_animations.res")

signal update_color(item)


## identifies which data array item belongs to and returns the array
func get_array_of_item(selected_item: Item) -> Array[Item]:
	var all_item_arrays = [all_bodies_data, all_eyes_data, all_brows_data, all_mouths_data, all_hair_data, all_clothes_data, all_accessories_data]
	for data_array in all_item_arrays:
		if selected_item in data_array: 
			return data_array
	return []


## gets Item files from path and returns the array of Items
func get_items(path) -> Array[Item]:
	var items_array: Array[Item] = []
	for file in DirAccess.get_files_at(path):
		var resource_file = path + file
		var item: Item = load(resource_file) as Item
		items_array.append(item)
	return items_array


## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	all_bodies_data = get_items("res://data/body/")
	all_eyes_data = get_items("res://data/eyes/")
	all_brows_data = get_items("res://data/brows/")
	all_mouths_data = get_items("res://data/mouths/")
	all_hair_data = get_items("res://data/hair/")
	all_clothes_data = get_items("res://data/clothes/")
	all_accessories_data = get_items("res://data/accessories/")
	all_items_data = all_bodies_data+all_eyes_data+all_brows_data+all_mouths_data+all_hair_data+all_clothes_data+all_accessories_data
