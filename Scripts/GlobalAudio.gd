extends AudioStreamPlayer
var volume : float = 1.0
var music_player: AudioStreamPlayer


func _ready():
	music_player = $"."
# Play the music
func play_music():
	music_player.play()


# Stop the music
func stop_music():
	music_player.stop()

func set_volume(new_volume):
	volume = clamp(new_volume, 0.0, 1.0)
	emit_signal("settings_button_pressed", volume)
	music_player.volume_db = volume * -80.0

