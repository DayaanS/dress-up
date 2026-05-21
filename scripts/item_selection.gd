extends Control

@onready var item_list: ItemList = %ItemList
@export var character: Character
@export var root: Node
var character_scene = preload("res://scenes/skeleton.tscn")
var all_items:Array[Item] = []
var selected_items:Dictionary = {}

@onready var item_color_selection: Control = $"../ItemColorSelection"

func get_items(items_array):
	for file in DirAccess.get_files_at("res://data/items"):
		var resource_file = "res://data/items/" + file
		var item:Item = load(resource_file) as Item
		items_array.append(item)
	return all_items


func add_layer():
	var instance:Character = character_scene.instantiate()
	instance.scale = character.scale
	instance.position = character.position
	root.add_child(instance)
	return instance


func _on_item_list_multi_selected(index: int, selected: bool) -> void:
	if selected == true:
		var layer:Character = add_layer()
		layer.add_item(all_items[index])
		item_color_selection.add_item_colors(all_items[index])
		selected_items[index] = layer
	else:
		selected_items[index].queue_free()
		item_color_selection.remove_item_colors()
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_items(all_items)
	for item in all_items:
		item_list.add_item(item.name, item.icon, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
