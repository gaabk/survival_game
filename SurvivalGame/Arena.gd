extends Node2D

@export var enemies: Array[PackedScene]
@export var power_ups: Array[PackedScene]

# Configura o nó ao inicializar a arena do jogo
func _ready():
	Global.node_creation_parent = self
	Global.points = 0

# Reseta o nó global ao sair da árvore de cena
func _exit_tree():
	Global.node_creation_parent = false

# Controla o tempo e posição de spawn dos inimigos
func _on_enemy_spawn_timer_timeout() -> void:
	var enemy_position = Vector2(randi_range(-160, 670), randi_range(-90, 390))
	# Garante que o inimigo não apareça muito próximo das bordas
	while enemy_position.x < 640 and enemy_position.x > -80 and enemy_position.y < 360 and enemy_position.y > -45:
		enemy_position = Vector2(randi_range(-160, 670), randi_range(-90, 390))

	var enemy_number = randi_range(0, enemies.size()- 1)
	
	Global.instance_node(enemies[enemy_number], enemy_position, self)
	$Enemy_spawn_timer.wait_time *= 0.95

# Aumenta a dificuldade ao reduzir o tempo de spawn dos inimigos
func _on_difficulty_timer_timeout() -> void:
	if $Enemy_spawn_timer.wait_time > 0.5:
		$Enemy_spawn_timer.wait_time -+ 0.05

# Controla o spawn de power-ups na arena
func _on_power_up_spawn_timer_timeout() -> void:
	var power_up_number = randi_range(0, power_ups.size()- 1)
	
	Global.instance_node(power_ups[power_up_number], Vector2(randi_range(0, 640), randi_range(0, 360)), self)
