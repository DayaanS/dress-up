extends Node

var all_clothes_data:Array[Item] = []
var all_hair_front_data:Array[Item] = []
var all_hair_back_data:Array[Item] = []
var all_items_data: Array[Item] = []

# gets Item files from path and returns the array of Items
func get_items(path):
	var items_array:Array[Item] = []
	for file in DirAccess.get_files_at(path):
		var resource_file = path + file
		var item:Item = load(resource_file) as Item
		items_array.append(item)
	return items_array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	all_clothes_data = get_items("res://data/items/")
	all_hair_back_data = get_items("res://data/hair_back/")
	all_hair_front_data = get_items("res://data/hair_front/")
	all_items_data = all_clothes_data + all_hair_back_data + all_hair_front_data


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
