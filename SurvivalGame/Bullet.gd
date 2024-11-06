extends Sprite2D

var velocity = Vector2(1, 0)
var speed = 250
var damage

var look_once = true

# Move e ajusta a direção da bala ao ser criada
func _process(delta):
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	global_position += velocity.rotated(rotation) * speed * delta

# Remove a bala quando ela sai da tela para economizar recursos
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
