extends Control

@onready var item_list: ItemList = %ItemList
@export var character: Character
var all_items:Array[Item] = []
var selected_items:Array[Item] = []

func get_items(items_array:Array):
	#var all_items:Array[Item] = []
	for file in DirAccess.get_files_at("res://data/items"):
		var resource_file = "res://data/items/" + file
		var item:Item = load(resource_file) as Item
		items_array.append(item)
	#return all_items

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass # Replace with function body.
	get_items(all_items)
	for item in all_items:
		item_list.add_item(item.name, item.icon, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_item_list_multi_selected(index: int, selected: bool) -> void:
	if selected == true:
		character.add_item(all_items[index])
	else:
		pass
	
