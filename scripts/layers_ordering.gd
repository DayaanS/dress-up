extends Control

var selected_layers = []
@onready var item_list: ItemList = $VBoxContainer/ItemList
@export var layers_parent_node: Node2D

var all_layers:Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	all_layers = layers_parent_node.get_children()
	for i in range(len(all_layers)-1, -1, -1):
		item_list.add_item(str(i))

func add_layer_to_UI(index, selected):
	#all_layers = layers_parent_node.get_children()
	#for i in range(len(all_layers)-1, -1, -1):
		#item_list.add_item(str(i))
	if selected == true:
		item_list.add_item(str(index))
	else:
		item_list.remove_item(index)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_list_multi_selected(index: int, selected: bool) -> void:
	pass
	#if selected == true:
		#selected_layers.append(index)
		#print(selected_layers)
	#else: 
		#selected_layers.erase(index)
		#print(selected_layers)


func _on_up_pressed() -> void:
	selected_layers = item_list.get_selected_items()
	all_layers = layers_parent_node.get_children()
	for layer in selected_layers:
		item_list.move_item(layer, layer - 1)
		var layer_node = all_layers[3-layer]
		layers_parent_node.move_child(layer_node, layer_node.get_index() + 1)

func _on_down_pressed() -> void:
	selected_layers = item_list.get_selected_items()
	all_layers = layers_parent_node.get_children()
	for layer in selected_layers:
		item_list.move_item(layer, layer + 1)
		var layer_node = all_layers[3-layer]
		layers_parent_node.move_child(layer_node, layer_node.get_index() - 1)


func _on_to_top_pressed() -> void:
	selected_layers = item_list.get_selected_items()
	all_layers = layers_parent_node.get_children()
	for layer in selected_layers:
		item_list.move_item(layer, 0)
		var layer_node = all_layers[3-layer]
		layers_parent_node.move_child(layer_node, len(all_layers))



func _on_to_bottom_pressed() -> void:
	var item_list_size = item_list.item_count
	selected_layers = item_list.get_selected_items()
	all_layers = layers_parent_node.get_children()
	for layer in selected_layers:
		item_list.move_item(layer, item_list_size-1)
		var layer_node = all_layers[3-layer]
		layers_parent_node.move_child(layer_node, 0)
