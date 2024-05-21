extends Node
class_name main

const hardness :int = 500

var sonic_is_active = false

var puzzle_area = preload("res://scenes/Puzzle_Area.tscn")


func _on_sonic_button_down():
	if sonic_is_active == false:
		sonic_is_active = true
		$Sonic.text="Sonic"
		
		$Node2D/Tile1.texture = preload("res://art/Sonic/Tile1.png")
		$Node2D/Tile2.texture = preload("res://art/Sonic/Tile2.png")
		$Node2D/Tile3.texture = preload("res://art/Sonic/Tile3.png")
		$Node2D/Tile4.texture = preload("res://art/Sonic/Tile4.png")
		$Node2D/Tile5.texture = preload("res://art/Sonic/Tile5.png")
		$Node2D/Tile6.texture = preload("res://art/Sonic/Tile6.png")
		$Node2D/Tile7.texture = preload("res://art/Sonic/Tile7.png")
		$Node2D/Tile8.texture = preload("res://art/Sonic/Tile8.png")
		$Node2D/Tile9.texture = preload("res://art/Sonic/Tile9.png")
		$Node2D/Tile10.texture = preload("res://art/Sonic/Tile10.png")
		$Node2D/Tile11.texture = preload("res://art/Sonic/Tile11.png")
		$Node2D/Tile12.texture = preload("res://art/Sonic/Tile12.png")
		$Node2D/Tile13.texture = preload("res://art/Sonic/Tile13.png")
		$Node2D/Tile14.texture = preload("res://art/Sonic/Tile14.png")
		$Node2D/Tile15.texture = preload("res://art/Sonic/Tile15.png")
		
	else:
		sonic_is_active = false
		$Sonic.text="Numbers"
		
		$Node2D/Tile1.texture = preload("res://art/numbers/Tile1.png")
		$Node2D/Tile2.texture = preload("res://art/numbers/Tile2.png")
		$Node2D/Tile3.texture = preload("res://art/numbers/Tile3.png")
		$Node2D/Tile4.texture = preload("res://art/numbers/Tile4.png")
		$Node2D/Tile5.texture = preload("res://art/numbers/Tile5.png")
		$Node2D/Tile6.texture = preload("res://art/numbers/Tile6.png")
		$Node2D/Tile7.texture = preload("res://art/numbers/Tile7.png")
		$Node2D/Tile8.texture = preload("res://art/numbers/Tile8.png")
		$Node2D/Tile9.texture = preload("res://art/numbers/Tile9.png")
		$Node2D/Tile10.texture = preload("res://art/numbers/Tile10.png")
		$Node2D/Tile11.texture = preload("res://art/numbers/Tile11.png")
		$Node2D/Tile12.texture = preload("res://art/numbers/Tile12.png")
		$Node2D/Tile13.texture = preload("res://art/numbers/Tile13.png")
		$Node2D/Tile14.texture = preload("res://art/numbers/Tile14.png")
		$Node2D/Tile15.texture = preload("res://art/numbers/Tile15.png")
	pass

