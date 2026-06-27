extends Control

#@export var item:Item
@onready var color_list: VBoxContainer =$Panel/MarginContainer/VBoxContainer
var item_part_color_selection = preload("res://scenes/item_part_color_selection.tscn")

# adds colors of Item data
func add_item_colors(item:Item):
	# clear colors 
	for color_button in color_list.get_children():
		color_button.queue_free()
		
	# add default colors from Item data
	for i in len(item.colors):
		var item_part_color_selection_instance = item_part_color_selection.instantiate()
		item_part_color_selection_instance.color = item.colors[i]
		item_part_color_selection_instance.part_name = item.parts[i].name
		item_part_color_selection_instance.color_picker_index = i
		color_list.add_child(item_part_color_selection_instance)

func remove_item_colors():
	for color_button in color_list.get_children():
		color_button.queue_free()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
