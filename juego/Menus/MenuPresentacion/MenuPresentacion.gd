#MenuPresentacion.gd
tool
extends Control

## Atributos Export
export(String, FILE, "*.tscn") var menu_inicial = ""

## Metodos
func _ready() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	cargar.cargar_datos_configuracion()
	cargar.cargar_datos_juego()

func _get_configuration_warning() -> String:
	if menu_inicial == "":
		return "No Hay Menu Inicial Asignado"
	return ""

## Metodos Custom
func cargar_menu() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_inicial)
