extends Control

var selected_layers_indexes = []
@onready var item_list: ItemList = $VBoxContainer/ItemList
@export var layers_parent_node: Node2D

var all_layers:Array[Node]
var current_layer_count: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	all_layers = layers_parent_node.get_children()
	for i in range(len(all_layers)-1, -1, -1):
		item_list.add_item("body")
		item_list.move_item(item_list.item_count-1, 0)
		

func add_layer_to_UI(item_id, selected, icon):
	#all_layers = layers_parent_node.get_children()
	#for i in range(len(all_layers)-1, -1, -1):
		#item_list.add_item(str(i))
		
	item_list.add_item(item_id, icon)
	item_list.move_item(item_list.item_count-1, 0)
	current_layer_count += 1

func remove_layer_from_UI(item_id):
	for i in range(item_list.item_count):
		var layer_text = item_list.get_item_text(i)
		if item_id == layer_text:
			item_list.remove_item(i)
			current_layer_count -= 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_list_multi_selected(index: int, selected: bool) -> void:
	pass
	#if selected == true:
		#selected_layers_indexes.append(index)
		#print(selected_layers_indexes)
	#else: 
		#selected_layers_indexes.erase(index)
		#print(selected_layers_indexes)


func _on_up_pressed() -> void:
	selected_layers_indexes = item_list.get_selected_items()
	all_layers = layers_parent_node.get_children()
	for layer_index in selected_layers_indexes:
		item_list.move_item(layer_index, layer_index - 1)
		var layer_node = all_layers[current_layer_count - layer_index]
		layers_parent_node.move_child(layer_node, layer_node.get_index() + 1)

func _on_down_pressed() -> void:
	selected_layers_indexes = item_list.get_selected_items()
	all_layers = layers_parent_node.get_children()
	for layer_index in selected_layers_indexes:
		item_list.move_item(layer_index, layer_index + 1)
		var layer_node = all_layers[current_layer_count - layer_index]
		layers_parent_node.move_child(layer_node, layer_node.get_index() - 1)


func _on_to_top_pressed() -> void:
	selected_layers_indexes = item_list.get_selected_items()
	all_layers = layers_parent_node.get_children()
	for layer_index in selected_layers_indexes:
		item_list.move_item(layer_index, 0)
		var layer_node = all_layers[3-layer_index]
		layers_parent_node.move_child(layer_node, len(all_layers))



func _on_to_bottom_pressed() -> void:
	var item_list_size = item_list.item_count
	selected_layers_indexes = item_list.get_selected_items()
	all_layers = layers_parent_node.get_children()
	for layer_index in selected_layers_indexes:
		item_list.move_item(layer_index, item_list_size-1)
		var layer_node = all_layers[3-layer_index]
		layers_parent_node.move_child(layer_node, 0)
