class_name ItemPartColorSelection
extends HBoxContainer
## Color picker button and label for [ItemPart]

@export var color: Color ## default color of color picker button
@export var part_name: String ## [ItemPart] name for label text
@onready var color_picker_button: ColorPickerButton = $ColorPickerButton ## color picker button node
@onready var label: Label = $Label ## label node
var color_picker_index: int = 0 ## what index ItemPartColorSelection has on the whole [ItemColorSelection] list


## change color on [Item] colors array of certain index
func change_item_color(item:Item, index:int, color:Color) -> void:
	item.colors[index] = color


func _on_color_picker_button_color_changed(color: Color) -> void:
	change_item_color(Global.selected_item, color_picker_index, color)
	Global.emit_signal("update_color")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_picker_button.color = color
	label.text = part_name
