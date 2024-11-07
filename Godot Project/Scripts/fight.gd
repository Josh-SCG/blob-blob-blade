extends Node2D

func _on_root_achieve_check_body_exited(body: Node2D) -> void:
	$root_achieve_check/Indicators.visible = false
	GameTrackingGlobal.achieve_root_check = false
