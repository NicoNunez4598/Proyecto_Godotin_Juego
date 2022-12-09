#InputAccion.gd
tool
extends Button

## Atributos Export
export var accion: String

## Atributos
var traducciones:= {
	"Space": "Barra Espaciadora",
	"Up": "Flecha Arriba",
	"Down": "Flecha Abajo",
	"Right": "Flecha Derecha",
	"Left": "Flecha Izquierda",
	"Caps Lock": "Bloq Mayus"
}

## Metodos
func _ready() -> void:
	assert(InputMap.has_action(accion))
	set_process_unhandled_input(false)
	mostrar_input_actual()

func _get_configuration_warning() -> String:
	if accion == "":
		return "No hay Accion Asignada"
	return ""

func _unhandled_input(evento: InputEvent) -> void:
	remapear_accion(evento)
	pressed = false

## Metodos Custom
func mostrar_input_actual() -> void:
	var input_actual: String = InputMap.get_action_list(accion)[0].as_text()
	text = traducir_input(input_actual)

func traducir_input(input_actual: String) -> String:
	if input_actual in traducciones:
		return traducciones[input_actual]
	return input_actual

func remapear_accion(evento: InputEvent) -> void:
	InputMap.action_erase_events(accion)
	InputMap.action_add_event(accion, evento)
	text = traducir_input(evento.as_text())

## Señales Internas
func _on_toggled(boton_presionado: bool) -> void:
	set_process_unhandled_input(boton_presionado)
	if boton_presionado:
		text = "Asignar Input..."
		release_focus()
	else:
		mostrar_input_actual()
