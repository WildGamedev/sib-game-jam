extends Button

@export var braille_font: Font
@export var normal_font: Font

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	_apply_braille_style()

func _apply_braille_style():
	#var style = theme.get_stylebox("normal", "").duplicate()
	# Создаем тему на лету
	add_theme_font_override("font", braille_font)

func _apply_normal_style():
	add_theme_font_override("font", normal_font)

func _on_mouse_entered():
	_apply_normal_style()

func _on_mouse_exited():
	_apply_braille_style()
