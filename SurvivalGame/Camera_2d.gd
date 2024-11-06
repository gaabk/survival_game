extends Camera2D

var screen_shake_start = false
var shake_intensity = 0

# Inicializa a câmera global para controlar o tremor
func _ready():
	Global.camera = self

# Reseta a câmera global ao sair da árvore de cena
func _exit_tree():
	Global.camera = null

# Controla o efeito de tremor da câmera
func _process(delta):
	zoom = lerp(zoom, Vector2(1, 1), 0.3)

	if screen_shake_start == true:
		global_position += Vector2(randi_range(-shake_intensity, shake_intensity), randi_range(-shake_intensity, shake_intensity)) * delta
	else:
		global_position = lerp(global_position, Vector2(320, 180), 0.3)

# Inicia o tremor da câmera com intensidade e duração específicas
func screen_shake(intensity, time):
	zoom = Vector2(1, 1) - Vector2(intensity * 0.0015, intensity * 0.0015)
	shake_intensity = intensity
	$Screen_shake_time.wait_time = time
	$Screen_shake_time.start()
	screen_shake_start = true

# Para o tremor da câmera
func _on_screen_shake_time_timeout() -> void:
	screen_shake_start = false
	
