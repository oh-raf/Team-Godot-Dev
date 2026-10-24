extends CanvasLayer

signal closed

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	%NextButton.pressed.connect(_on_lanjut_pressed)

func setup(foto: Texture2D, nama: String, nim: String, peran: String):
	%Foto.texture = foto
	%Nama.text = nama
	%Nim.text = "NIM: " + nim
	%Peran.text = peran

func _on_lanjut_pressed():
	closed.emit()
	queue_free()
