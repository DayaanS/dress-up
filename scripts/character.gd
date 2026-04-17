extends Node2D

@onready var torso: Sprite2D = $Body/Torso
@onready var neck: Sprite2D = $Body/Neck
@onready var head: Sprite2D = $Body/Neck/Head
@onready var ear_l: Sprite2D = $Body/Neck/Head/EarL
@onready var ear_r: Sprite2D = $Body/Neck/Head/EarR
@onready var arm_l: Sprite2D = $Body/ArmL
@onready var arm_r: Sprite2D = $Body/ArmR
@onready var forearm_r: Sprite2D = $Body/ArmR/ForearmR
@onready var forearm_l: Sprite2D = $Body/ArmL/ForearmL
@onready var hand_l: Sprite2D = $Body/ArmL/ForearmL/HandL
@onready var hand_r: Sprite2D = $Body/ArmR/ForearmR/HandR
@onready var thigh_l: Sprite2D = $Body/ThighL
@onready var calf_l: Sprite2D = $Body/ThighL/CalfL
@onready var thigh_r: Sprite2D = $Body/ThighR
@onready var calf_r: Sprite2D = $Body/ThighR/CalfR

@onready var pants_torso: Sprite2D = $Body/Torso/PantsTorso
@onready var pants_thigh_r: Sprite2D = $Body/ThighR/PantsThighR
@onready var pants_calf_r: Sprite2D = $Body/ThighR/CalfR/PantsCalfR
@onready var pants_thigh_l: Sprite2D = $Body/ThighL/PantsThighL
@onready var pants_calf_l: Sprite2D = $Body/ThighL/CalfL/PantsCalfL


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func set_color(color_name, color):
	var body_parts_list = [torso,neck,head,ear_l,ear_r,arm_l,arm_r,forearm_r,forearm_l,hand_l,hand_r,thigh_l,calf_l,thigh_r,calf_r]
	var pants_parts_list = [pants_calf_l,pants_calf_r,pants_thigh_l,pants_thigh_r,pants_torso]
	match color_name:
		"Skin":
			for body_part in body_parts_list:
				body_part.self_modulate = color
		"Pants":
			for pants_part in pants_parts_list:
				pants_part.self_modulate = color
			
