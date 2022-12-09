extends Control

## Atributos Export
export (String, FILE, "*.tscn") var menu_principal = ""

func _ready() -> void:
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pausa"):
		visible = not visible
		get_tree().paused = not get_tree().paused
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_BotonContinuar_pressed() -> void:
	get_tree().paused = false
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_BotonMenuPrincipal_pressed() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	cargar.guardar_datos_juego()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_principal)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
