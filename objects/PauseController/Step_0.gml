if (global.input.pause) {
	if (paused) {
		instance_activate_all();
	} else {
		instance_deactivate_all(true);
		instance_activate_object(InputController);
	}
	paused = !paused
}