extends Node2D



func _on_finish_area_body_entered(body: Node2D) -> void:
	if body is Player:
		$CanvasLayer/Control/AnimationPlayer.play("WinAnim")
		get_tree().paused = true
