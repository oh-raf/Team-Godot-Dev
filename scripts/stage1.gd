extends Node2D

const PROFILE_CARD = preload("res://scenes/profile_card.tscn")
var sudah_selesai := false

func _on_killzone_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene.call_deferred()

func _on_finish_body_entered(body):
	if body.is_in_group("player") and not sudah_selesai:
		sudah_selesai = true
		get_tree().paused = true
		var card = PROFILE_CARD.instantiate()
		add_child(card)
		card.setup(
			preload("res://assets/pixelate/pixelate rafif.png"),
			"Muhammad Rafif Imtithal",
			"240533608447",
			"Project Manager"
		)
		card.closed.connect(_on_card_closed)

func _on_card_closed():
	get_tree().paused = false
	# Stage 2 belum ada, sementara muat ulang stage ini
	get_tree().reload_current_scene()
