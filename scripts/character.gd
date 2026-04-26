extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func set_color(color_name, color):
	match color_name:
		"Skin":
			var parts = get_tree().get_nodes_in_group("skin")
			for part in parts:
				part.self_modulate = color
		"Pants":
			pass
		"Eyes":
			$Body/Neck/Head/EyeL/EyeWhite/EyeIris.self_modulate = color
			$Body/Neck/Head/EyeR/EyeWhite/EyeIris.self_modulate = color
		"Top":
			$Body/ArmL/ForearmL/HandL/Sprite2D.self_modulate = color
			$Body/ArmL/ForearmL/Sprite2D2.self_modulate = color
			$Body/ArmL/Sprite2D3.self_modulate = color
			$Body/ArmR/Sprite2D4.self_modulate = color
			$Body/ArmR/ForearmR/Sprite2D3.self_modulate = color
			$Body/ArmR/ForearmR/HandR/Sprite2D2.self_modulate = color
			$Body/Torso/Sprite2D.self_modulate = color
		"Hair":
			var parts = get_tree().get_nodes_in_group("hair")
			for part in parts:
				part.self_modulate = color
				
func add_item():
	var item_part = ItemPart.new()
	#node.set_name("node")
	var parent = get_node(item_part.parent)
	parent.add_child(item_part)
