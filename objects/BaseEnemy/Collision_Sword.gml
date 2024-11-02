if (other.is_flying) {
	other.is_flying = false
	instance_destroy()
} else {
	x = old_x
	y = old_y
}