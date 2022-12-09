extends Control

onready var etiquetas_vidas = $ContenedorVidas/Cantidad

onready var etiquetas_monedas_oro = $ContenedorMonedasOro/Cantidad

func _ready():
# warning-ignore:return_value_discarded
	Eventos.connect("actualizar_hud", self, "actualizar_hud")
	actualizar_hud()

func actualizar_hud():
	etiquetas_vidas.text = "%s" % DatosJuego.vidas
	etiquetas_monedas_oro.text = "%s" % DatosJuego.monedas_oro
