extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var tiles: TileMapLayer
@export var solid_tiles: TileMapLayer



func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2()

	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var obj = collision.get_collider()
		if obj is TileMapLayer:
			var pos = collision.get_position()
			var mpos = tiles.local_to_map(pos)
			#var data = solid_tiles.get_cell_tile_data(mpos)
			#var has_collision = false
			#if data.get_collision_polygons_count(0) > 0:
				#has_collision = true
			#if has_collision:
			tiles.set_cell(mpos)
