extends Control

@onready var item_list: ItemList = %ItemList
@onready var hair_front_list: ItemList = %HairFront
@onready var hair_back_list: ItemList = %HairBack
@onready var layers: Node2D = $"../../Layers"
@onready var layers_ui: Control = $"../LayersUI"


@export var character: Character
@export var root: Node
var character_scene = preload("res://scenes/skeleton.tscn")

var all_items:Array[Item] = []
var all_hair_front:Array[Item] = []
var all_hair_back:Array[Item] = []

var selected_items:Dictionary = {}

@onready var item_color_selection: Control = $"../ItemColorSelection"

# populates item selection with items
func get_items(path):
	var items_array:Array[Item] = []
	for file in DirAccess.get_files_at(path):
		var resource_file = path + file
		var item:Item = load(resource_file) as Item
		items_array.append(item)
	return items_array


func add_layer():
	var instance:Character = character_scene.instantiate()
	instance.scale = character.scale
	instance.position = character.position
	layers.add_child(instance)
	return instance



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	all_items = get_items("res://data/items/")
	all_hair_back = get_items("res://data/hair_back/")
	all_hair_front = get_items("res://data/hair_front/")
	for item in all_items:
		item_list.add_item(item.name, item.icon, true)
	for item in all_hair_back:
		hair_back_list.add_item(item.name, item.icon, true)
	for item in all_hair_front:
		hair_front_list.add_item(item.name, item.icon, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func add_item_to_body(all_items, index:int, selected: bool):
	var layer:Character = add_layer()
	if selected == true:
		layer.add_item(all_items[index])
		item_color_selection.add_item_colors(all_items[index])
		selected_items[index] = layer
		
		layers_ui.add_layer_to_UI(layer.get_index(), selected)
	else:
		selected_items[index].queue_free()
		item_color_selection.remove_item_colors()
		
		layers_ui.add_layer_to_UI(layer.get_index(), selected)


func _on_item_list_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(all_items, index, selected)

func _on_hair_front_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(all_hair_front,index,selected)
	
func _on_hair_back_multi_selected(index: int, selected: bool) -> void:
	add_item_to_body(all_hair_back, index, selected)
