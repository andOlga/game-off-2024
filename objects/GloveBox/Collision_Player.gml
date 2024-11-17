if (image_blend == c_white) { // non-carry
	event_inherited()
} else { // carry
	other.x = other.xprevious
	other.y = other.yprevious
	x = xprevious
	y = yprevious
}