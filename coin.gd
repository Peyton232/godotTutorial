extends StaticBody2D

signal collected

func collected():
	emit_signal("collected")
	queue_free()
