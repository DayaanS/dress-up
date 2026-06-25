extends HBoxContainer
@export var color: Color
@export var part_name:String
@onready var color_picker_button: ColorPickerButton = $ColorPickerButton
@onready var label: Label = $Label
@export var layer: Skeleton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_picker_button.color = color
	label.text = part_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_color_picker_button_color_changed(color: Color) -> void:
	pass
	#layer.set_color("color",color)
