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


func _on_hair_color_picker_button_color_changed(color: Color) -> void:
	character.set_color("Hair",color)


func _on_eyes_color_picker_button_color_changed(color: Color) -> void:
	character.set_color("Eyes",color)


func _on_top_color_picker_button_color_changed(color: Color) -> void:
	character.set_color("Top",color)
	
	



func _on_button_pressed() -> void:
	character.set_pose("Default")


func _on_button_2_pressed() -> void:
	character.set_pose("Pose 1")


func _on_add_item_button_pressed() -> void:
	character.add_item()
