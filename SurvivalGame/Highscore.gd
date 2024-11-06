extends Label

# Exibe a pontuação mais alta
func _ready():
	text = str(Global.highscore)

# Atualiza o highscore quando a pontuação atual ultrapassa o recorde
func _process(_delta):
	if Global.points > Global.highscore:
		Global.highscore = Global.points
		
		
