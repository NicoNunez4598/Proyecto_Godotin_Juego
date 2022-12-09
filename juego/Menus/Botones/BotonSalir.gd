extends Button

func _on_pressed() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	cargar.guardar_datos_juego()
	get_tree().quit()
