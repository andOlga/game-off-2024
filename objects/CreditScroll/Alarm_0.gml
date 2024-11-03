///@description Scroll text

text_y--
if (text_y > text_min_y) { // Still scrolling
	alarm[0] = 1
} else { // Scroll done
	alarm[1] = 5
}