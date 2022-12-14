#DatosJuego.gd
extends Node

## Atributos
var vidas = 3
var monedas_oro = 0
var nivel_actual:String = ""
var num_nivel_actual:int = 0
var proximo_nivel:String = ""
var puntaje = 0

## Metodos Custom
func reset() -> void:
	vidas = 3
	reset_monedas()
	puntaje = 0

func generar_puntaje() -> int:
	var valor_oro = monedas_oro * 10
	puntaje = valor_oro
	return puntaje

func restar_vidas() -> void:
	vidas -= 1
	if vidas == 0:
		Eventos.emit_signal("game_over")
	Eventos.emit_signal("actualizar_hud")

func sumar_monedas():
	monedas_oro += 1
	Eventos.emit_signal("actualizar_hud")

func reset_monedas() -> void:
	monedas_oro = 0
