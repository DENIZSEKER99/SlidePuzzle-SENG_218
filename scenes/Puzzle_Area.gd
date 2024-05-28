extends Area2D
class_name puzzle_area

var tiles = []
var solved = []
var mouse = false
var hardness = 50
var sound_is_on = true
var music_is_on =true
var moves = 0
static var min_moves
var min_moves_is_null = true


func _ready():
	if music_is_on:
		$MusicStreamPlayer.play()
	start_game()

func start_game():
	tiles = [$Tile1, $Tile2,
	$Tile3, $Tile4, $Tile5, $Tile6,$Tile7, $Tile8, $Tile9,
	$Tile10, $Tile11, $Tile12, $Tile13, $Tile14, $Tile15, $Tile16 ]
	solved = tiles.duplicate()
	shuffle_tiles()

func shuffle_tiles():
	var previous = 99
	var previous_1 = 98
	for t in range(0,hardness):
		var tile = randi() % 16
		if tiles[tile] != $Tile16 and tile != previous and tile != previous_1:
			var rows = int(tiles[tile].position.y / 250)
			var cols = int(tiles[tile].position.x / 250)
			check_neighbours(rows,cols)
			previous_1 = previous
			previous = tile
			moves=0

func hard_shuffle_tiles():
	var previous = 99
	var previous_1 = 98
	for t in range(0,hardness*10):
		var tile = randi() % 16
		if tiles[tile] != $Tile16 and tile != previous and tile != previous_1:
			var rows = int(tiles[tile].position.y / 250)
			var cols = int(tiles[tile].position.x / 250)
			check_neighbours(rows,cols)
			previous_1 = previous
			previous = tile
			moves=0

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouse:
		var mouse_copy = mouse
		print(mouse.position)
		mouse = false
		var rows = int(mouse_copy.position.y / 250)
		var cols = int(mouse_copy.position.x / 250)
		check_neighbours(rows,cols)
		if tiles == solved:
			if min_moves_is_null:
				min_moves = moves
				$Highest_Score.text = str(min_moves)
				min_moves_is_null = false
			elif min_moves > moves:
				min_moves = moves
				$Highest_Score.text = str(min_moves)
				min_moves_is_null = false
			if sound_is_on:
				$AudioStreamPlayer.stream=preload("res://art/audio/Small Win.mp3")
				$AudioStreamPlayer.play()
				pass
			var you_win = preload("res://scenes/You win.tscn")
			var win_instance = you_win.instantiate()
			add_child(win_instance)
			$Timer.start()

func check_neighbours(rows, cols):
	var empty = false
	var done = false
	var pos = rows * 4 + cols
	while !empty and !done:
		var new_pos = tiles[pos].position
		if rows < 3:
			new_pos.y += 250
			empty = find_empty(new_pos,pos)
			new_pos.y -= 250
		if rows > 0:
			new_pos.y -= 250
			empty = find_empty(new_pos,pos)
			new_pos.y += 250
		if cols < 3:
			new_pos.x += 250
			empty = find_empty(new_pos,pos)
			new_pos.x -= 250
		if cols > 0:
			new_pos.x -= 250
			empty = find_empty(new_pos,pos)
			new_pos.x += 250
		done = true

func find_empty(position,pos):
	var new_rows = int(position.y / 250)
	var new_cols = int(position.x / 250)
	var new_pos = new_rows * 4 + new_cols
	if tiles[new_pos] == $Tile16:
		swap_tiles(pos, new_pos)
		return true
	else:
		return false

func swap_tiles(tile_src, tile_dst):
	var temp_pos = tiles[tile_src].position
	tiles[tile_src].position = tiles[tile_dst].position
	tiles[tile_dst].position = temp_pos
	var temp_tile = tiles[tile_src]
	tiles[tile_src] = tiles[tile_dst]
	tiles[tile_dst] = temp_tile
	moves = moves+1
	$Current_Score.text=str(moves)
	if sound_is_on:
		$AudioStreamPlayer.stream = preload("res://art/audio/Whip Woosh.mp3")
		$AudioStreamPlayer.play()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		mouse = event

func _on_shuffle_button_down():
	shuffle_tiles()
	pass

func _on_hard_shuffle_button_down():
	hard_shuffle_tiles()
	pass

func _on_sound_button_button_down():
	if sound_is_on:
		$Sound_Button.icon=preload("res://art/Icons/Sound_off.png")
		sound_is_on = false
	else:
		$Sound_Button.icon = preload("res://art/Icons/Sound_on.png")
		sound_is_on = true
	pass

func _on_timer_timeout():
	remove_child($Win_Screen)
	remove_child($Win_Screen1)
	remove_child($Win_Screen2)
	remove_child($Win_Screen3)
	pass

func _on_music_button_button_down():
	if music_is_on:
		$Music_Button.icon=preload("res://art/Icons/music_off.png")
		music_is_on=false
		$MusicStreamPlayer.stop()
	else:
		$Music_Button.icon =preload("res://art/Icons/music_on.png")
		music_is_on = true
		$MusicStreamPlayer.play()
	pass


func _on_restart_button_down():
	
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.
