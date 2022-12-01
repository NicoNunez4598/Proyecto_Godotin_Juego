#Nivel.gd
extends Node

## Atributos Export
export(String, FILE, "*.tscn") var nivel_actual = null
export(String, FILE, "*.tscn") var menu_game_over = null

## Metodos
func _ready() -> void:
	Eventos.connect("game_over", self, "game_over")

## Metodos Custom
func game_over() -> void:
	DatosPlayer.nivel_actual = nivel_actual
	get_tree().change_scene(menu_game_over)
