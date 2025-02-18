extends AudioStreamPlayer

func _ready():
	play()  # Starts music

func toggle_music():
	if playing:
		stop()
	else:
		play()
