extends Control

func _ready():
	pass

func _on_mmb_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_mmb_options_pressed():
	get_tree().change_scene_to_file("res://scenes/optionsmenu.tscn")

func _on_mmb_quit_pressed():
	get_tree().quit()
