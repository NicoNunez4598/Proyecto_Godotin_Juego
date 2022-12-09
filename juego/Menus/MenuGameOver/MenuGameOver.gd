extends Control

var nivel_actual = ""

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	nivel_actual = DatosJuego.nivel_actual
	DatosJuego.reset()

func _on_BotonMenuPrincipal_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Juego/Menus/MenuPrincipal.tscn")

func _on_BotonReintentar_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene(nivel_actual)
