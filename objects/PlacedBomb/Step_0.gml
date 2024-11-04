///@description Glow redder and explode
if (explosion_timer <= 255) {
	image_blend = make_color_rgb(explosion_timer, 0, 0)
} else {	
	instance_create_layer(x - 32, y - 32, "Instances", PlacedBombExplosion)
	instance_destroy()
}