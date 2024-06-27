extends StaticBody2D

@onready var polygon: Polygon2D = $Polygon2D
@onready var coll_polygon: CollisionPolygon2D = $CollisionPolygon2D


func _ready() -> void:
	coll_polygon.polygon = polygon.polygon
	coll_polygon.transform = polygon.transform
