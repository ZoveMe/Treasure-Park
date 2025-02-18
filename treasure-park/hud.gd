extends CanvasLayer

var coinscollected = 0
var timeleft = 120

@onready var label_coin = $Label_Coin
@onready var time_label = $Time
@onready var win_message = $"../GameWin"  

func _ready():
	label_coin.text = "Coins: " + str(coinscollected)
	time_label.text = "Time: " + str(timeleft)
	win_message.visible = false  # Hide the win message initially

func _on_coin_body_entered(body):
	coinscollected += 1
	label_coin.text = "Coins: " + str(coinscollected)

	if coinscollected >= 5:  # If player collects 5 coins
		win_game()

func _on_timer_timeout():
	timeleft -= 1
	time_label.text = "Time: " + str(timeleft)
	
	if timeleft == 0:
		get_tree().reload_current_scene()  # Restart game if time runs out

func win_game():
	win_message.text = " Win!"  # Set the win message
	win_message.visible = true  # Make it visible
	get_tree().paused = true  # Pause the game
