extends Node

var score = 0 # player's score
var level = 2 #player's current level
var ground_bouncing: bool = false # state for bouncing ground
var bounce_timer: Timer # timer to disable bounce

# add points to score (called from elsewhere)
func addPoints(points):
	score += points
func _process(delta: float) -> void:
	# update GUI with new score
	$CanvasLayer/ScoreLabel.text = str(score)
	$CanvasLayer/LevelLabel.text = "Level: "+str(level)
