extends Node2D

# load the scene
var meteor_scene: PackedScene = load("res://Scene/meteor.tscn")

func _on_meteor_timer_timeout() -> void:
	# create an instance
	var meteor = meteor_scene.instantiate()
	# attach the node to the scene tree
	$Meteors.add_child(meteor)
