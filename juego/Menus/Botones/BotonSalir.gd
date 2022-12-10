extends Button

func _on_pressed() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
# warning-ignore:return_value_discarded
	cargar.guardar_datos_juego()
	get_tree().quit()
