#Nivel.gd
tool
extends Node

## Atributos Export
export var numero_nivel:int = 0
export(String, FILE, "*.tscn") var proximo_nivel = ""
export(String, FILE, "*.tscn") var menu_game_over = ""
export(String, FILE, "*.tscn") var menu_inicio = ""

## Metodos
func _ready() -> void:
	yield(get_tree().create_timer(4.0), "timeout")
	actualizar_datos()
# warning-ignore:return_value_discarded
	Eventos.connect("game_over", self, "game_over")
	$MusicaFondo.play()

func _get_configuration_warning() -> String:
	if numero_nivel == 0 or proximo_nivel == "":
		return "Chequear valores de nivel"
	return ""

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		var cargar: GuardarCargar = GuardarCargar.new()
# warning-ignore:return_value_discarded
		cargar.guardar_datos_juego()
# warning-ignore:return_value_discarded
		get_tree().change_scene(menu_inicio)


## Metodos Custom
func game_over() -> void:
# warning-ignore:standalone_expression
	DatosJuego.nivel_actual
	$MusicaFondo.stop()
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_game_over)

func actualizar_datos() -> void:
	DatosJuego.nivel_actual = get_tree().current_scene.filename
	DatosJuego.num_nivel_actual = numero_nivel
	DatosJuego.proximo_nivel = proximo_nivel
