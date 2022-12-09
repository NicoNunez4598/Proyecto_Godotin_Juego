#Portal.gd
class_name PortalNivel
extends Area

## Atributos Export
export(String, FILE, "*.tscn") var proximo_nivel = ""

## Señales Internas
func _on_body_entered(body: Node) -> void:
	if body is Godotin:
		if proximo_nivel != "":
# warning-ignore:return_value_discarded
			get_tree().change_scene(proximo_nivel)
