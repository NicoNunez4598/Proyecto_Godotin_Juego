#MonedaDorada.gd
class_name Moneda
extends Area

## Señales Internas
# warning-ignore:unused_argument
func _on_body_entered(body: Node) -> void:
	DatosJuego.sumar_monedas()
	$Colisionador.set_deferred("disabled", true)
	$AnimationPlayer.play("consumida")
