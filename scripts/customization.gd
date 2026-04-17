extends Node2D
@onready var character: Node2D = $Character


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_skin_color_picker_button_color_changed(color: Color) -> void:
	character.set_color("Skin", color)


func _on_pants_color_picker_button_color_changed(color: Color) -> void:
	character.set_color("Pants",color)
