extends Node2D

const ASTEROID_SCENE = preload("res://scenes/kill_de_dinnosaurs.tscn")

var pontos: int = 0

func _on_timer_timeout() -> void:
	pontos += 1
	$CanvasLayer/Label.text = str(pontos)
	var asteroid: Node2D = ASTEROID_SCENE.instantiate()
	
	var screen_size = get_viewport_rect().size
	
	asteroid.position = Vector2(screen_size.x, randf_range(0, screen_size.y))
	
	add_child(asteroid)


func _on_space_supership_game_over() -> void:
	print("game over")
	get_tree().call_deferred("reload_current_scene")
