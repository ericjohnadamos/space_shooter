extends Node2D

# load the scene
var meteor_scene: PackedScene = load("res://Scene/meteor.tscn")
var laser_scene: PackedScene = load("res://Scene/laser.tscn")

func _ready() -> void:
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $Stars.get_children():
		var rand_x = rng.randi_range(0, size.x)
		var rand_y = rng.randi_range(0, size.y)
		star.position = Vector2(rand_x, rand_y)

func _on_meteor_timer_timeout() -> void:
	# create an instance
	var meteor = meteor_scene.instantiate()
	# attach the node to the scene tree
	$Meteors.add_child(meteor)


func _on_player_laser(pos) -> void:
	# create an instance
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
