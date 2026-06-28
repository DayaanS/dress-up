extends Control

var selected_layer_index = 0
@onready var layers_list: ItemList = $VBoxContainer/LayersList
@export var items_parent_node: Node2D
@export var item_color_selection: Control
@export var item_selection: Control

var all_selected_items_nodes:Array[Node]
var current_layer_count: int = -1


func add_layer_to_UI(item_id, selected, icon):
	layers_list.add_item(item_id, icon)
	layers_list.move_item(layers_list.item_count-1, 0)
	current_layer_count += 1


func remove_layer_from_UI(item_id):
	# need it to deselect from item selection grid to solve previously freed bug
	for i in range(layers_list.item_count):
		var layer_text = layers_list.get_item_text(i)
		if item_id == layer_text:
			layers_list.remove_item(i)
			current_layer_count -= 1


func _on_to_top_pressed() -> void:
	selected_layer_index = layers_list.get_selected_items()[0]
	all_selected_items_nodes = items_parent_node.get_children()
	
	layers_list.move_item(selected_layer_index, 0)
	var item_node = all_selected_items_nodes[current_layer_count-selected_layer_index]
	items_parent_node.move_child(item_node, len(all_selected_items_nodes))


func _on_up_pressed() -> void:
	selected_layer_index = layers_list.get_selected_items()[0]
	all_selected_items_nodes = items_parent_node.get_children()
	layers_list.move_item(selected_layer_index, selected_layer_index - 1)
	var item_node = all_selected_items_nodes[current_layer_count - selected_layer_index]
	items_parent_node.move_child(item_node, item_node.get_index() + 1)

func _on_down_pressed() -> void:
	selected_layer_index = layers_list.get_selected_items()[0]
	all_selected_items_nodes = items_parent_node.get_children()
	
	layers_list.move_item(selected_layer_index, selected_layer_index + 1)
	var item_node = all_selected_items_nodes[current_layer_count - selected_layer_index]
	if item_node.get_index() >= 1: 
		# for item not appear on top again if the item already on the lowest layer
		items_parent_node.move_child(item_node, item_node.get_index() - 1)


func _on_to_bottom_pressed() -> void:
	var layers_list_size = layers_list.item_count
	selected_layer_index = layers_list.get_selected_items()[0]
	all_selected_items_nodes = items_parent_node.get_children()

	layers_list.move_item(selected_layer_index, layers_list_size-1)
	var item_node = all_selected_items_nodes[current_layer_count-selected_layer_index]
	items_parent_node.move_child(item_node, 0)


func _on_remove_pressed() -> void:
	if Global.selected_item:
		var selected_item_array = Global.get_array_of_item(Global.selected_item)
		var index = selected_item_array.find(Global.selected_item)
		item_selection.add_item_to_body(selected_item_array, index, false)
		item_selection.deselect_item(selected_item_array, index)
	else:
		pass


func _on_layers_list_item_selected(index: int) -> void:
	var item_id = layers_list.get_item_text(index)
	for item in Global.all_items_data:
		if item_id == item.item_id:
			Global.selected_item = item
			item_color_selection.add_item_colors(item)
