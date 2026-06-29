class_name ItemColorSelection
extends Control
## Color selection UI for selected layer(item)

## Container for all colors of item
@onready var color_list: VBoxContainer =$Panel/MarginContainer/VBoxContainer
## [ItemPartColorSelection] scene to instantiate
var item_part_color_selection:PackedScene = preload("res://scenes/item_part_color_selection.tscn")

## removes all color pickers and labels
func remove_item_colors() -> void:
	for color_button in color_list.get_children():
		color_button.queue_free()


## adds color pickers and labels for each color of [Item]
func add_item_colors(item:Item) -> void:
	remove_item_colors()
	for i in len(item.colors):
		var item_part_color_selection_instance = item_part_color_selection.instantiate()
		item_part_color_selection_instance.color = item.colors[i]
		item_part_color_selection_instance.part_name = item.parts[i].name
		item_part_color_selection_instance.color_picker_index = i
		color_list.add_child(item_part_color_selection_instance)
