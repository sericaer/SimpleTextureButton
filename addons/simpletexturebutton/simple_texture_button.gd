@tool
extends TextureButton
class_name SimpleTextureButton

@export var normal_color : Color  = Color.WHITE :
	get:
		return _normal_color
	set(value):
		_normal_color = value
		_update_color()

@export var pressed_color : Color = Color(0.784, 0.784, 0.784) :
	get:
		return _pressed_color
	set(value):
		_pressed_color = value
		_update_color()

@export var hover_color : Color = Color(0.922, 0.922, 0.922) :
	get:
		return _hover_color
	set(value):
		_hover_color = value
		_update_color()

@export var disabled_color : Color = Color(0.627, 0.627, 0.627):
	get:
		return _disabled_color
	set(value):
		_disabled_color = value
		_update_color()

var _normal_color : Color = Color.WHITE
var _pressed_color : Color  = Color(0.784, 0.784, 0.784)
var _hover_color : Color = Color(0.922, 0.922, 0.922)
var _disabled_color : Color = Color(0.627, 0.627, 0.627)

func _init() -> void :
	if texture_normal:
		var image = texture_normal.get_image()
		var bitmap = BitMap.new()
		bitmap.create_from_image_alpha(image)
		texture_click_mask = bitmap

func _draw() -> void:
	_update_color()

func _update_color() -> void:
	var draw_mode: int = get_draw_mode()
	match draw_mode:
		DRAW_HOVER_PRESSED: 
			modulate = pressed_color
		DRAW_PRESSED:
			modulate = pressed_color
		DRAW_NORMAL:
			modulate = normal_color
		DRAW_HOVER:
			modulate = hover_color
		DRAW_DISABLED:
			modulate = disabled_color
