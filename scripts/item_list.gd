extends Control

@onready var item_list: ItemList = %ItemList

func get_items() -> Array[Item]:
	var all_items:Array[Item] = []
	for file in DirAccess.get_files_at("res://data/items"):
		var resource_file = "res://data/items/" + file
		var item:Item = load(resource_file) as Item
		all_items.append(item)
	return all_items

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	var all_items = get_items()
	print(all_items)
	for item in all_items:
		item_list.add_item(item.name, item.icon, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
