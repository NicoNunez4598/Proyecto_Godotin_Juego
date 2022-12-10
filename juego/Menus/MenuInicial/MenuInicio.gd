#MenuInicio.gd
tool
extends Control

## Atributos Export
export (String, FILE, "*.tscn") var menu_ajustes = ""
export (String, FILE, "*.tscn") var nivel_inicial = ""
export (String, FILE, "*.tscn") var pantalla_carga = ""

## Metodos
func _ready() -> void:
	activar_boton_cargar()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$MusicaFondo.play()

func _get_configuration_warning() -> String:
	if menu_ajustes == "":
		return "Chequear Rutas"
	return ""

## Metodos Custom
func activar_boton_cargar() -> void:
	var partida: GuardarCargar = GuardarCargar.new()
	var ruta: String = partida.seleccionar_ruta(partida.JUEGO)
	var dir: Directory = Directory.new()
	if dir.file_exists(ruta):
		$ContenedorPrincipal/BotonCargar.disabled = false
	else:
		$ContenedorPrincipal/BotonCargar.disabled = true
	$MusicaFondo.stop()

## Señales Internas
func _on_BotonSalir_pressed() -> void:
	get_tree().quit()

func _on_BotonOpciones_pressed() -> void:
	$BotonSFX.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_ajustes)

func _on_BotonNuevo_pressed() -> void:
	var borrar: GuardarCargar = GuardarCargar.new()
# warning-ignore:return_value_discarded
	borrar.borrar_datos_juego()
	DatosJuego.nivel_actual = nivel_inicial
	$MusicaFondo.stop()
# warning-ignore:return_value_discarded
	get_tree().change_scene(pantalla_carga)

func _on_BotonCargar_pressed() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	cargar.cargar_datos_juego()
# warning-ignore:return_value_discarded
	get_tree().change_scene(pantalla_carga)
