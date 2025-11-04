extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var tiles: TileMapLayer
@export var solid_tiles: TileMapLayer

var observe_radius = 13.0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2()

	move_and_slide()
	
	delete_tiles()

func delete_tiles():
	for i in range(-1, 2):
		for j in range(-1, 2):
			var mpos = tiles.local_to_map(position + Vector2(i, j) * observe_radius)
			if solid_tiles.get_cell_source_id(mpos) != -1:
				tiles.set_cell(mpos)
