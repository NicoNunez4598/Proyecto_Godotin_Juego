#MenuIntermedio.gd
extends Control

## Atributos Export
export (String, FILE, "*.tscn") var pantalla_carga = ""

## Atributos Onready
onready var titulo = $Titulo
onready var puntos = $Puntos

## Metodos
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	titulo.text = "Nivel {num} Completo".format({"num": DatosJuego.num_nivel_actual})
	puntos.text = "{puntos}\nPuntos Totales".format({"puntos": DatosJuego.generar_puntaje()})

## Señales Internas
func _on_BotonNivel_pressed() -> void:
	DatosJuego.nivel_actual = DatosJuego.proximo_nivel
# warning-ignore:return_value_discarded
	get_tree().change_scene(pantalla_carga)
