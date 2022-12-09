#PlayerDummy.gd
extends KinematicBody

## Atributos Export
export var cantidad_rotacion: int = 20

## Metodos
func _ready() -> void:
	$Animaciones.play("run-cycle")

func _process(delta: float) -> void:
	$Armadura.rotation_degrees.y += cantidad_rotacion * delta
