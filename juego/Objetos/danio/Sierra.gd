#Sierra.gd
extends Area

## Señales Internas
func _on_body_entered(body: Node) -> void:
	var player: Godotin = body
	if player.has_method("respawn"):
		player.respawn()
