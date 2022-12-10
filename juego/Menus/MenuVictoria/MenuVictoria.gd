#MenuVictoria.gd
extends Control

## Atributos Onready
onready var etiquetas_puntaje = $Puntaje

## Atributos Export
export(String, FILE, "*.tscn") var menu_inicio = ""

func _ready():
	etiquetas_puntaje.text = "Puntaje: {p}".format({"p": DatosJuego.generar_puntaje()})

func _on_BotonMenuPrincipal_pressed():
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_inicio)
