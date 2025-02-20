@tool
extends EditorPlugin


const SimpleTextureButton := preload("simple_texture_button.gd")

func _enter_tree() -> void:
	self.add_custom_type("SimpleTextureButton", "TextureButton", SimpleTextureButton, preload("simple_texture_button.svg"))

func _exit_tree() -> void:
	self.remove_custom_type("SimpleTextureButton")
