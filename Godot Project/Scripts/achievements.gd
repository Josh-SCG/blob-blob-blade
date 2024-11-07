extends Node2D

@onready var win = $Achieve_Icon/Achieve_Win
@onready var deflect = $Achieve_Icon/Achieve_Deflect
@onready var root = $Achieve_Icon/Achieve_Root
@onready var health = $Achieve_Icon/Achieve_Health

func _ready() -> void:
	$Box_Name.text = " "
	$Box_Contents.text = "Hover over an achievement icon for more information."
	
	win.frame = 42 + int(GameTrackingGlobal.achieve_win)
	deflect.frame = 48 + int(GameTrackingGlobal.achieve_deflect)
	root.frame = 54 + int(GameTrackingGlobal.achieve_root)
	health.frame = 30 + int(GameTrackingGlobal.achieve_health)

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_win_mouse_entered() -> void:
	$Box_Name.text = "Sweet Victory"
	$Box_Contents.text = "Defeat  the  Sprite  and  claim  victory!"


func _on_deflect_mouse_entered() -> void:
	$Box_Name.text = "Deflection"
	$Box_Contents.text = "Deflect  many  of  the  Sprite's  bullets. \n Progress: " + str(GameTrackingGlobal.achieve_deflect_counter) + "/40"


func _on_root_mouse_entered() -> void:
	$Box_Name.text = "Rooted"
	$Box_Contents.text = "Defeat  the  Sprite  while  not  moving  further  than  a  half  road  from  the  starting  corner (Look for the indicators on the field)."


func _on_health_mouse_entered() -> void:
	$Box_Name.text = "Skilled"
	$Box_Contents.text = "Claim  victory  over  the  Sprite  while  having  taken  no  damage."


func _on_win_mouse_exited() -> void:
	$Box_Name.text = " "
	$Box_Contents.text = "Hover  over  an  achievement  icon  for  more  information."


func _on_deflect_mouse_exited() -> void:
	$Box_Name.text = " "
	$Box_Contents.text = "Hover  over  an  achievement  icon  for  more  information."


func _on_root_mouse_exited() -> void:
	$Box_Name.text = " "
	$Box_Contents.text = "Hover  over  an  achievement  icon  for  more  information."


func _on_health_mouse_exited() -> void:
	$Box_Name.text = " "
	$Box_Contents.text = "Hover  over  an  achievement  icon  for  more  information."
