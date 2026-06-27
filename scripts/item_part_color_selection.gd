extends HBoxContainer
@export var color: Color
@export var part_name:String

@onready var color_picker_button: ColorPickerButton = $ColorPickerButton
@onready var label: Label = $Label

@export var item_node: Skeleton

@export var item_selection: Node

var color_picker_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_picker_button.color = color
	label.text = part_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func change_item_color(item:Item, index:int, color:Color):
	item.colors[index] = color
	
func _on_color_picker_button_color_changed(color: Color) -> void:
	change_item_color(Global.selected_item, color_picker_index, color)
	
	
