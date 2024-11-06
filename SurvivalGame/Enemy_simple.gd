extends "res://Enemy_core.gd"

# Movimenta o inimigo simples em direção ao jogador
func _process(delta):
	super(delta)
	basic_movement_towards_player(delta)

	
