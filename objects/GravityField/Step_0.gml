///@description Drag objects

for (var obj_to_pull_idx = 0; obj_to_pull_idx < array_length(objects_to_pull); obj_to_pull_idx++) {
	ds_list_clear(instances_met)
	instance_place_list(x, y, objects_to_pull[obj_to_pull_idx], instances_met, false)
	with (objects_to_pull[obj_to_pull_idx]) {
		gravity = 0
		if (object_index == GloveBox && image_blend == c_red) {
			image_blend = c_white
		}
		for (var met_check_idx = 0; met_check_idx < ds_list_size(other.instances_met); met_check_idx++) {
			if (id == other.instances_met[| met_check_idx]) {
				if (object_index == GloveBox) {
					speed = 0
					image_blend = c_red
				}
				gravity = other.pull_strength
				gravity_direction = other.image_angle
			}
		}
	}
}