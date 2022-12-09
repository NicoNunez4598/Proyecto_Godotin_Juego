#CambiarVolumen.gd
extends Button

## Atributos Export
export(NodePath) var nodo_sfx

## Atributos
var boton_sfx: AudioStreamPlayer

## Metodos
func _ready() -> void:
	connect("pressed", self, "presionado")
	boton_sfx = get_node(nodo_sfx)

## Metodos Custom
func presionado() -> void:
	boton_sfx.play()
