extends CPUParticles2D

# Desativa o processamento do nó quando o efeito de sangue expira
func _on_freeze_blood_timeout() -> void:
	set_process(false)
	set_physics_process(false)
	set_process_input(false)
	set_process_internal(false)
	set_process_unhandled_input(false)
	set_process_unhandled_key_input(false)
