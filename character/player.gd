extends CharacterBody2D
class_name Player

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@export var tiles: TileMapLayer
@export var solid_tiles: TileMapLayer

@onready var observe_radius = $Observer/CollisionShape2D.shape.radius

var directions = {
	Vector2.UP: 0,
	Vector2.RIGHT: 1,
	Vector2.DOWN: 2,
	Vector2.LEFT: 3
}

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	var index = directions.get(direction, 0)
	if direction:
		rotation = index * PI/2
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
