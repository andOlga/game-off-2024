///@description Fix swordlessness
if (!other.has_sword) {
	other.has_sword = true
	var sword = instance_create_layer(other.x, other.y, "Instances", Sword)
	sword.player_instance = other.id
	instance_destroy()
}