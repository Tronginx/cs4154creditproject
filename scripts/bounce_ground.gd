extends StaticBody2D


var is_bouncy = false  # Keeps track of whether the ground is bouncy

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	$BounceGroundTimer.start()  # Start the timer
	toggle_collision(false)  # Initially disable collision

# Handle collision with the ball
func _on_body_entered(body):
	if is_bouncy and body.name == "Ball" or body.name == "Ball2":  # If the ball hits the bouncy ground
		var ball = body
		ball.velocity.y = -abs(ball.velocity.y)  # Make the ball bounce upward


func _on_bounce_ground_timer_timeout() -> void:
	is_bouncy = !is_bouncy  # Toggle the bouncy state
	toggle_collision(is_bouncy)

	if is_bouncy:
		$Sprite2D.modulate = Color(0, 1, 0, 1)  # Change color to green
	else:
		$Sprite2D.modulate = Color(1, 1, 1, 1)  # Default color
		
		
func toggle_collision(enable: bool) -> void:
	$CollisionShape2D.disabled = not enable
