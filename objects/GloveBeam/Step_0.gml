///@description Range limit
event_inherited()
if (!is_flying || distance_to_object(player_instance) > 32) {
	instance_destroy()
}