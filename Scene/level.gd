extends Node2D

# load the scene
var meteor_scene: PackedScene = load("res://Scene/meteor.tscn")
var laser_scene: PackedScene = load("res://Scene/laser.tscn")

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
