extends Node
var all_bodies_data: Array[Item] = []
var all_eyes_data: Array[Item] = []
var all_brows_data: Array[Item] = []
var all_mouths_data: Array[Item] = []
var all_hair_data:Array[Item] = []
var all_clothes_data:Array[Item] = []
var all_items_data: Array[Item] = []

var selected_item:Item

signal update_color(item)


# identifies which data array item belongs to
# there's definetly a better way to do this but it works for now
func get_array_of_item(selected_item: Item):
	for item in all_bodies_data:
		if selected_item == item:
			return all_bodies_data
	for item in all_eyes_data:
		if selected_item == item:
			return all_eyes_data
	for item in all_brows_data:
		if selected_item == item:
			return all_brows_data
	for item in all_mouths_data:
		if selected_item == item:
			return all_mouths_data
	for item in all_hair_data:
		if selected_item == item:
			return all_hair_data
	for item in all_clothes_data:
		if selected_item == item:
			return all_clothes_data


# gets Item files from path and returns the array of Items
func get_items(path) -> Array[Item]:
	var items_array:Array[Item] = []
	for file in DirAccess.get_files_at(path):
		var resource_file = path + file
		var item:Item = load(resource_file) as Item
		items_array.append(item)
	return items_array


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	all_bodies_data = get_items("res://data/body/")
	all_eyes_data = get_items("res://data/eyes/")
	all_brows_data = get_items("res://data/brows/")
	all_mouths_data = get_items("res://data/mouths/")
	all_hair_data = get_items("res://data/hair/")
	all_clothes_data = get_items("res://data/items/")
	
	all_items_data = all_bodies_data+all_eyes_data+all_brows_data+all_mouths_data+all_hair_data+all_clothes_data 
